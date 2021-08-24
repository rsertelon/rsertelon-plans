pkg_name=dovecot
pkg_origin=rsertelon
pkg_version=2.3.16
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_description="The Secure IMAP server"
pkg_upstream_url="https://dovecot.org"
pkg_license=("LGPL-2.1" "MIT")
pkg_source="https://dovecot.org/releases/2.3/dovecot-${pkg_version}.tar.gz"
pkg_shasum="03a71d53055bd9ec528d55e07afaf15c09dec9856cba734904bfd05acbc6cf12"

pigeonhole_version=0.5.16
pigeonhole_dirname="dovecot-2.3-pigeonhole-${pigeonhole_version}"
pigeonhole_filename="${pigeonhole_dirname}.tar.gz"
pigeonhole_file_shasum="5ca36780e23b99e6206440f1b3fe3c6598eda5b699b99cebb15d418ba3c6e938"

pkg_deps=(
  core/bzip2
  core/gcc-libs
  core/glibc
  core/lz4
  core/mysql-client
  core/openssl
  core/zlib
)
pkg_build_deps=(
  core/diffutils
  core/file
  core/gcc
  core/make
  core/pkg-config
)
pkg_bin_dirs=(
  bin
  sbin
)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

pkg_svc_user="root"
pkg_svc_group="root"

do_download() {
  do_default_download

  download_file "https://pigeonhole.dovecot.org/releases/2.3/${pigeonhole_filename}" "$pigeonhole_filename" "$pigeonhole_file_shasum"
}

do_verify() {
  do_default_verify

  verify_file "$pigeonhole_filename" "$pigeonhole_file_shasum"
  return $?
}

do_clean() {
  do_default_clean

  rm -rf "$HAB_CACHE_SRC_PATH/${pigeonhole_dirname}"
}

do_unpack() {
  do_default_unpack

  unpack_file ${pigeonhole_filename}
}

do_prepare() {
  export CFLAGS="${CFLAGS} -O2"
  export CXXFLAGS="${CXXFLAGS} -O2"

  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
    _clean_file=true
  fi
}

do_build() {
  # build dovecot
  ./configure --prefix=${pkg_prefix} \
    --with-mysql \
    --with-sql

  make -j$(nproc)

  # build pigeonhole
  pushd "$HAB_CACHE_SRC_PATH/${pigeonhole_dirname}"
    ./configure --prefix=${pkg_prefix} \
      --with-dovecot=../$pkg_dirname/

    make -j$(nproc)
  popd
}

do_install() {
  # install dovecot
  do_default_install

  # install pigeonhole
  pushd "$HAB_CACHE_SRC_PATH/${pigeonhole_dirname}"
    make install
  popd
}

do_end() {
  # Clean up
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
}
