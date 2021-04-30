pkg_name=zlib-static
pkg_origin=rsertelon
pkg_version=1.2.11
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('Zlib')
pkg_source="http://zlib.net/fossils/zlib-${pkg_version}.tar.gz"
pkg_dirname="zlib-${pkg_version}"
pkg_shasum="c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1"
pkg_build_deps=(
  core/make
  core/gcc
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  pushd "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    ./configure --static
    make
  popd
}

do_install() {
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/libz.a $pkg_prefix/lib/
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/*.h $pkg_prefix/include/
}