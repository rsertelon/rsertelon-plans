pkg_name=umurmur
pkg_origin=rsertelon
pkg_version="0.3.1"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("BSD-3-Clause")
pkg_upstream_url="https://umurmur.net/"
pkg_description="A minimalistic Mumble server primarily targeted to run on embedded computers"
pkg_source="https://github.com/umurmur/umurmur/archive/v${pkg_version}.tar.gz"
pkg_shasum="8327dd0b2c5bd187a38d098295e896a6b85d698c9268205bcb27f6244f760a73"

pkg_build_deps=(
  core/cmake
  core/gcc
)
pkg_deps=(
  core/cacerts
  core/openssl11
  core/protobuf-c
  rsertelon/libconfig
)

pkg_bin_dirs=(bin)

pkg_svc_user="hab"
pkg_svc_group="hab"

do_build() {
  cmake -B builddir \
    -DCMAKE_INSTALL_PREFIX=$pkg_prefix \
    -DSSL=openssl \
    -DOPENSSL_ROOT_DIR=$(pkg_path_for "core/openssl11") \
    -DLIBCONFIG_INCLUDE_DIR=$(pkg_path_for "rsertelon/libconfig")/include \
    -DLIBCONFIG_LIBRARIES=$(pkg_path_for "rsertelon/libconfig")/lib/libconfig.so \
    -DPROTOBUFC_INCLUDE_DIR=$(pkg_path_for "core/protobuf-c")/include \
    -DPROTOBUFC_LIBRARIES=$(pkg_path_for "core/protobuf-c")/lib/libprotobuf-c.so
  cmake --build builddir
  
}

do_install() {
  DESTDIR="$pkg_prefix" cmake --install builddir
}