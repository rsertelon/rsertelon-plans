pkg_name=zlib-static
pkg_origin=rsertelon
pkg_version=1.3.1
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('Zlib')
pkg_source="http://zlib.net/fossils/zlib-${pkg_version}.tar.gz"
pkg_dirname="zlib-${pkg_version}"
pkg_shasum="9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
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