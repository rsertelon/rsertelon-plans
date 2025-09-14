pkg_name=boost-build
pkg_origin=rsertelon
pkg_description='Boost.Build is a text-based system for developing, testing, and installing software'
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
)

pkg_build_deps=(
  core/gcc
)

pkg_bin_dirs=(bin)

do_build() {
  pushd "tools/build"
    fix_interpreter "src/engine/build.sh" core/coreutils bin/env

    ./bootstrap.sh
  popd
}

do_install() {
  pushd "tools/build"
    ./b2 install -q --debug-configuration --prefix="$pkg_prefix"
  popd
}
