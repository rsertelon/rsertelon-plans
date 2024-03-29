pkg_name=boost-build
pkg_origin=rsertelon
pkg_description='Boost.Build is a text-based system for developing, testing, and installing software'
pkg_upstream_url='http://www.boost.org/'
pkg_version=1.80.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license=('Boost Software License')
pkg_dirname="boost_${pkg_version//./_}"
pkg_source="https://boostorg.jfrog.io/artifactory/main/release/${pkg_version}/source/${pkg_dirname}.tar.gz"
pkg_shasum="4b2136f98bdd1f5857f1c3dea9ac2018effe65286cf251534b6ae20cc45e1847"

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
