pkg_name=imagemagick
pkg_origin=rsertelon
pkg_version=7.1.2-30
pkg_description="A software suite to create, edit, compose, or convert bitmap images."
pkg_upstream_url="http://imagemagick.org/"
pkg_license=('Apache-2.0')
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://github.com/ImageMagick/ImageMagick/archive/refs/tags/${pkg_version}.tar.gz"
pkg_shasum="3034a64f22398e15ee3dd1e6b1aa83d838cfc47df1bb246ae0eca9590e6ace72"
pkg_deps=(
  core/glibc
  core/zlib
  core/libpng
  core/xz
  core/gcc-libs
)
pkg_build_deps=(
  core/zlib
  core/coreutils
  core/diffutils
  core/patch
  core/make
  core/gcc
  core/sed
  core/glibc
  core/pkg-config
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include/ImageMagick-7)
pkg_lib_dirs=(lib)
pkg_dirname="ImageMagick-${pkg_version}"

do_build() {
    CC="gcc -std=gnu99" ./configure --prefix="${pkg_prefix}"
    make
}
