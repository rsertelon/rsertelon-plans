pkg_name=boost-build
pkg_origin=rsertelon
pkg_description='Boost.Build is a text-based system for developing, testing, and installing software'
pkg_upstream_url='http://www.boost.org/'
pkg_version=1.76.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license=('Boost Software License')
pkg_dirname="boost_${pkg_version//./_}"
pkg_source="https://dl.bintray.com/boostorg/release/${pkg_version}/source/${pkg_dirname}.tar.gz"
pkg_shasum="7bd7ddceec1a1dfdcbdb3e609b60d01739c38390a5f956385a12f3122049f0ca"

pkg_deps=(
  core/glibc
  core/gcc-libs
)

pkg_build_deps=(
  core/gcc
)

pkg_bin_dirs=(bin)

do_build() {
  pushd "tools/build"
    ./bootstrap.sh
  popd
}

do_install() {
  pushd "tools/build"
    ./b2 install -q --debug-configuration --prefix="$pkg_prefix"
  popd
}
