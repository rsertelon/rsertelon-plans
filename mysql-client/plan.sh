pkg_name=mysql-client
pkg_origin=core
pkg_version=8.0.21
pkg_maintainer='The Habitat Maintainers <humans@habitat.sh>'
pkg_license=('GPL-2.0')
pkg_source="https://github.com/mysql/mysql-server/archive/refs/tags/mysql-8.0.21.tar.gz"
pkg_shasum="cfee41b541a39eac160f85b28b9bc9e8bbd0ac3c63c6ac50df9edd8a5b1a56cf"
pkg_upstream_url="https://www.mysql.com/"
pkg_description="MySQL Client Tools"
pkg_deps=(
  core/coreutils
  core/gawk
  core/gcc-libs
  core/glibc
  core/grep
  core/inetutils
  core/libedit
  core/ncurses
  core/openssl11
  core/pcre
  core/perl
  core/procps-ng
  core/sed
)
pkg_build_deps=(
  rsertelon/boost172
  core/cmake
  core/diffutils
  core/gcc
  core/git
  core/make
  core/patch
  core/patchelf
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_dirname="mysql-server-mysql-${pkg_version}"

do_build() {
  cmake . -DFORCE_INSOURCE_BUILD=1 \
          -DLOCAL_BOOST_DIR="$(pkg_path_for rsertelon/boost172)" \
          -DBOOST_INCLUDE_DIR="$(pkg_path_for rsertelon/boost172)"/include \
          -DWITH_BOOST="$(pkg_path_for rsertelon/boost172)" \
          -DCURSES_LIBRARY="$(pkg_path_for core/ncurses)/lib/libtinfo.so" \
          -DCURSES_INCLUDE_PATH="$(pkg_path_for core/ncurses)/include" \
          -DWITH_SSL=yes \
          -DOPENSSL_INCLUDE_DIR="$(pkg_path_for core/openssl11)/include" \
          -DOPENSSL_LIBRARY="$(pkg_path_for core/openssl11)/lib/libssl.so" \
          -DCRYPTO_LIBRARY="$(pkg_path_for core/openssl11)/lib/libcrypto.so" \
          -DWITHOUT_SERVER:BOOL=ON \
          -DCMAKE_INSTALL_PREFIX="$pkg_prefix"

  LD_LIBRARY_PATH="$(pkg_path_for core/gcc-libs)/lib:$LD_RUN_PATH"
  export LD_LIBRARY_PATH

  make --jobs="$(nproc)"
}

do_strip() {
  do_default_strip

  find "$pkg_prefix/bin" -type f -executable \
    -exec sh -c 'file -i "$1" | grep -q "x-executable; charset=binary"' _ {} \; \
    -exec patchelf --interpreter "$(pkg_path_for glibc)/lib/ld-linux-x86-64.so.2" --set-rpath "${LD_RUN_PATH}" {} \;

  find "$pkg_prefix/lib/" -name '*.so' -type f \
    -exec patchelf --set-rpath "${LD_RUN_PATH}" {} \;
}