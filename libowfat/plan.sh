pkg_name=libowfat
pkg_origin=rsertelon
pkg_version="0.34"
pkg_upstream_url="http://www.fefe.de/libowfat/"
pkg_description="Reimplement libdjb"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('GPL-2.0')
pkg_source="http://www.fefe.de/libowfat/libowfat-${pkg_version}.tar.xz"
pkg_shasum="d4330d373ac9581b397bc24a22ad1f7f5d58a7fe36d9d239fe352ceffc5d304b"
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

  mkdir -p ${pkg_prefix}/include/libowfat
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/*.h ${pkg_prefix}/include/
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/*.h ${pkg_prefix}/include/libowfat/
}