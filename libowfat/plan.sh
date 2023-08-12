pkg_name=libowfat
pkg_origin=rsertelon
pkg_version="0.32"
pkg_upstream_url="http://www.fefe.de/libowfat/"
pkg_description="Reimplement libdjb"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('GPL-2.0')
pkg_source="http://www.fefe.de/libowfat/libowfat-${pkg_version}.tar.xz"
pkg_shasum="f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
pkg_build_deps=(
  core/make
  core/gcc
  core/zlib
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  make
}

do_install() {
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/libowfat.a ${pkg_prefix}/lib/
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/*.h ${pkg_prefix}/include/
}