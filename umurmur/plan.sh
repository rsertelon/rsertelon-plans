pkg_name=umurmur
pkg_origin=rsertelon
pkg_version="0.2.17"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("BSD-3-Clause")
pkg_upstream_url="https://umurmur.net/"
pkg_description="A minimalistic Mumble server primarily targeted to run on embedded computers"
pkg_source="https://github.com/umurmur/umurmur/archive/${pkg_version}.tar.gz"
pkg_shasum="e77b7b6616768f4a1c07442afe49a772692f667b00c23cc85909d4dd0ce206d2"

pkg_build_deps=(
  core/cmake
  core/gcc
  core/make
)
pkg_deps=(
  core/cacerts
  core/openssl
  core/protobuf-c
  mozillareality/libconfig
)

pkg_bin_dirs=(bin)

pkg_svc_user="hab"
pkg_svc_group="hab"

do_build() {
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=$pkg_prefix \
    -DSSL=openssl \
    -DOPENSSL_ROOT_DIR=$(pkg_path_for "core/openssl") \
    -DLIBCONFIG_INCLUDE_DIR=$(pkg_path_for "mozillareality/libconfig")/include \
    -DLIBCONFIG_LIB_DIR=$(pkg_path_for "mozillareality/libconfig")/lib \
    -DPROTOBUFC_INCLUDE_DIR=$(pkg_path_for "core/protobuf-c")/include \
    -DPROTOBUFC_LIB_DIR=$(pkg_path_for "core/protobuf-c")/lib
  make
}

do_install() {
  cd build
  make install
}