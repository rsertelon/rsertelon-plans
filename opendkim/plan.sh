pkg_name=opendkim
pkg_origin=rsertelon
pkg_version="2.10.3"
pkg_upstream_url="http://www.opendkim.org"
pkg_description="OpenDKIM is a community effort to develop and maintain a C library for producing DKIM-aware applications and an open source milter for providing DKIM service. "
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('BSD-3-Clause')
pkg_source="https://freefr.dl.sourceforge.net/project/opendkim/opendkim-${pkg_version}.tar.gz"
pkg_shasum="43a0ba57bf942095fe159d0748d8933c6b1dd1117caf0273fa9a0003215e681b"
pkg_deps=(
  core/glibc
  core/libbsd
  rsertelon/libmilter
  core/openssl
)
pkg_build_deps=(
  core/autoconf
  core/automake
  core/diffutils
  core/file
  core/gcc
  core/libtool
  core/patch
  core/make
  core/pkg-config
)
pkg_bin_dirs=(sbin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)

do_prepare() {
  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
    _clean_file=true
  fi

  patch -Np1 -i "$PLAN_CONTEXT/patches/openssl_1.1.0_compat.patch"
  ACLOCAL_PATH="${ACLOCAL_PATH}:$(pkg_path_for core/pkg-config)/share/aclocal" autoreconf -i
}

do_build() {
  ./configure --prefix=${pkg_prefix} \
    --with-milter=$(pkg_path_for "rsertelon/libmilter")

  make
}

do_install() {
  make install
}

do_end() {
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
}
