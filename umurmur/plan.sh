pkg_name=umurmur
pkg_origin=rsertelon
pkg_version="0.2.20"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("BSD-3-Clause")
pkg_upstream_url="https://umurmur.net/"
pkg_description="A minimalistic Mumble server primarily targeted to run on embedded computers"
pkg_source="https://github.com/umurmur/umurmur/archive/${pkg_version}.tar.gz"
pkg_shasum="b7b2978c3197aef0a6531f1cf0ee1aebb32a55ad8bda43064ce3a944edbcac83"

pkg_build_deps=(
  core/cmake
  core/gcc
  core/make
)
pkg_deps=(
  core/cacerts
  core/openssl11
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
    -DOPENSSL_ROOT_DIR=$(pkg_path_for "core/openssl11") \
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