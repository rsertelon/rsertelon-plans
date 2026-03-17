pkg_name=libconfig
pkg_origin=rsertelon
pkg_version="1.8.2"
pkg_upstream_url="http://hyperrealm.github.io/libconfig/"
pkg_description="C/C++ Library for Processing Structured Configuration Files"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('LGPL-2.1-only')
pkg_source="https://hyperrealm.github.io/libconfig/dist/libconfig-${pkg_version}.tar.gz"
pkg_shasum="e59ffb902dd5731d5d4e4fb81d3b989697615feab72dfd7c30618167b91a42ee"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/gcc
  core/make
  core/pkg-config
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)

do_build() {
  ./configure --prefix=${pkg_prefix}

  make
}

do_install() {
  make install
}
