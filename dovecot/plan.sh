pkg_name=dovecot
pkg_origin=rsertelon
pkg_version=2.3.10
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_description="The Secure IMAP server"
pkg_upstream_url="https://dovecot.org"
pkg_license=("LGPL-2.1" "MIT")
pkg_source="https://dovecot.org/releases/${pkg_version%.*}/dovecot-${pkg_version}.tar.gz"
pkg_shasum="473184723d854a4d1dbd99c11a7b9f65156ca5fe6ecf85d9a44b5127e6f871c5"

pkg_deps=(
  core/bzip2
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

do_prepare() {
  export CFLAGS="${CFLAGS} -O2"
  export CXXFLAGS="${CXXFLAGS} -O2"

  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
    _clean_file=true
  fi
}

do_build() {
  ./configure --prefix=${pkg_prefix} \
    --with-mysql \
    --with-sql

  make -j$(nproc)
}

do_end() {
  # Clean up
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
}
