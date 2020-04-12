pkg_name=boost
pkg_origin=rsertelon
pkg_description='Boost provides free peer-reviewed portable C++ source libraries.'
pkg_upstream_url='http://www.boost.org/'
pkg_version=1.72.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license=('Boost Software License')
pkg_dirname="boost_${pkg_version//./_}"
pkg_source="https://dl.bintray.com/boostorg/release/${pkg_version}/source/${pkg_dirname}.tar.gz"
pkg_shasum="c66e88d5786f2ca4dbebb14e06b566fb642a1a6947ad8cc9091f9f445134143f"

pkg_deps=(
  core/glibc
  core/gcc-libs
  core/zlib
)

pkg_build_deps=(
  core/glibc
  core/gcc-libs
  core/coreutils
  core/diffutils
  core/patch
  core/make
  core/gcc
  core/python
  core/libxml2
  core/libxslt
  core/openssl
  core/which
)

pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  ./bootstrap.sh --prefix="$pkg_prefix"
}

do_install() {
  export NO_BZIP2=1
  export ZLIB_LIBRARY_PATH
  ZLIB_LIBRARY_PATH="$(pkg_path_for core/zlib)/lib"
  export ZLIB_INCLUDE
  ZLIB_INCLUDE="$(pkg_path_for core/zlib)/include"
  export CPLUS_INCLUDE_PATH
  CPLUS_INCLUDE_PATH="$(pkg_path_for core/python)/include/python3.7m"

  ./b2 install -q --debug-configuration
}
