pkg_name=boost
pkg_origin=rsertelon
pkg_description='Boost provides free peer-reviewed portable C++ source libraries.'
pkg_upstream_url='http://www.boost.org/'
pkg_version=1.89.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license=('Boost Software License')
pkg_dirname="boost_${pkg_version//./_}"
pkg_source="https://archives.boost.io/release/${pkg_version}/source/${pkg_dirname}.tar.gz"
pkg_shasum="9de758db755e8330a01d995b0a24d09798048400ac25c03fc5ea9be364b13c93"

pkg_deps=(
  core/coreutils
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
  core/libxml2
  core/libxslt
  core/openssl
  core/which
  core/python
)

pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  fix_interpreter "tools/build/src/engine/build.sh" core/coreutils bin/env

  ./bootstrap.sh --prefix="$pkg_prefix"
}

do_install() {
  export NO_BZIP2=1
  export ZLIB_LIBRARY_PATH
  ZLIB_LIBRARY_PATH="$(pkg_path_for core/zlib)/lib"
  export ZLIB_INCLUDE
  ZLIB_INCLUDE="$(pkg_path_for core/zlib)/include"
  export CPLUS_INCLUDE_PATH
  CPLUS_INCLUDE_PATH="$(pkg_path_for core/python)/include/python3.10"

  ./b2 install -q --debug-configuration
}
