pkg_name=boost
pkg_origin=rsertelon
pkg_description='Boost provides free peer-reviewed portable C++ source libraries.'
pkg_upstream_url='http://www.boost.org/'
pkg_version=1.77.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license=('Boost Software License')
pkg_dirname="boost_${pkg_version//./_}"
pkg_source="https://boostorg.jfrog.io/artifactory/main/release/${pkg_version}/source/${pkg_dirname}.tar.gz"
pkg_shasum="5347464af5b14ac54bb945dc68f1dd7c56f0dad7262816b956138fc53bcc0131"

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
  core/libxml2
  core/libxslt
  core/openssl
  core/which
  rsertelon/python
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
  CPLUS_INCLUDE_PATH="$(pkg_path_for rsertelon/python)/include/python3.7m"

  ./b2 install -q --debug-configuration
}
