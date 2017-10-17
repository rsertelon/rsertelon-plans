pkg_name=libowfat
pkg_origin=rsertelon
pkg_version="0.31"
pkg_upstream_url="http://www.fefe.de/libowfat/"
pkg_description="Reimplement libdjb"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('GPL-2.0')
pkg_source="http://www.fefe.de/libowfat/libowfat-${pkg_version}.tar.xz"
pkg_shasum="d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
pkg_build_deps=(core/make core/gcc core/zlib)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
    make
}

do_install() {
    cp $HAB_CACHE_SRC_PATH/$pkg_dirname/libowfat.a ${pkg_prefix}/lib/
    cp $HAB_CACHE_SRC_PATH/$pkg_dirname/*.h ${pkg_prefix}/include/
}