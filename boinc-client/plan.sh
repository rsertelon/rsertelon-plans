pkg_name=boinc-client
pkg_origin=rsertelon
pkg_version=7.18.1
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('LGPL-3.0')
pkg_upstream_url="https://boinc.berkeley.edu/"
pkg_source="https://github.com/BOINC/boinc/archive/client_release/${pkg_version%.*}/${pkg_version}.tar.gz"
pkg_dirname="boinc-client_release-${pkg_version%.*}-${pkg_version}"
pkg_shasum="274388d9c49e488b6c8502ffc6eb605d5ceae391fb0c2fc56dbb0254d0ceb27e"
pkg_deps=(
  core/curl
  core/gcc-libs
  core/glibc
  core/nghttp2
  core/openssl
  core/zlib
)
pkg_build_deps=(
  core/autoconf
  core/automake
  core/coreutils
  core/diffutils
  core/file
  core/gcc
  core/libtool
  core/m4
  core/make
  core/pkg-config
)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

do_prepare() {
  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for "core/file")/bin/file" /usr/bin/file
    _clean_file=true
  fi
  if [[ ! -r /bin/rm ]]; then
    ln -sv "$(pkg_path_for "core/coreutils")/bin/rm" /bin/rm
    _clean_rm=true
  fi
  if [[ ! -r /bin/rmdir ]]; then
    ln -sv "$(pkg_path_for "core/coreutils")/bin/rmdir" /bin/rmdir
    _clean_rmdir=true
  fi
}

do_build() {
  ## Could be set upstream (in both core/libtool and core/pkg-config)
  ACLOCAL_PATH="${ACLOCAL_PATH}:$(pkg_path_for core/libtool)/share/aclocal:$(pkg_path_for core/pkg-config)/share/aclocal"
  export ACLOCAL_PATH

  ./_autosetup
  ./configure --prefix="${pkg_prefix}" \
    --disable-dynamic-client-linkage \
    --disable-server \
    --disable-fcgi \
    --enable-client \
    --disable-manager \
    --enable-libraries \
    --disable-install-headers \
    --disable-boinczip \
    --disable-apps \
    --disable-unit-tests \
    CXXFLAGS="-O3 -funroll-loops -fforce-addr -ffast-math"
    
  make
}

do_end() {
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
  if [[ -n "$_clean_rm" ]]; then
    rm -fv /bin/rm
  fi
  if [[ -n "$_clean_rmdir" ]]; then
    rm -fv /bin/rmdir
  fi
}