pkg_name=libtorrent
pkg_origin=rsertelon
pkg_version="2.0.12"
pkg_upstream_url="http://libtorrent.org/"
pkg_description="Feature complete C++ BitTorrent implementation"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('BSD-2-Clause')
pkg_dirname="libtorrent-rasterbar-${pkg_version}"
pkg_filename="${pkg_dirname}.tar.gz"
pkg_source="https://github.com/arvidn/libtorrent/releases/download/v${pkg_version}/${pkg_filename}"
pkg_shasum="25b898d02e02e43ee9a8ea5480c20007f129091b5754d0283f94e4d51d11a19e"
pkg_deps=(
    core/gcc-libs
    core/glibc
    core/openssl
    core/python
    rsertelon/boost
)
pkg_build_deps=(
    core/cmake
    core/gcc
    core/make
)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_pconfig_dirs=(lib/pkgconfig)

# libtorrent's own CMake install()s the python module to a path computed by
# sysconfig with platbase/base blanked out -- but that template still leaves
# a leading "/" (e.g. "/lib/python3.14/site-packages"), and CMake always
# treats a DESTINATION starting with "/" as absolute, ignoring
# CMAKE_INSTALL_PREFIX. There's no cache variable to override that from the
# command line, so we compute the same path ourselves to know where to copy
# the module in do_install(), and where to point PYTHONPATH at runtime.
_python_site_packages() {
  "$(pkg_path_for core/python)/bin/python" -c \
    'import sysconfig; print(sysconfig.get_path("platlib", vars={"platbase": "", "base": ""}))'
}

do_setup_environment() {
  push_runtime_env PYTHONPATH "${pkg_prefix}$(_python_site_packages)"
}

do_build() {
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkg_prefix" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBOOST_ROOT="$(pkg_path_for rsertelon/boost)" \
    -DOPENSSL_ROOT_DIR="$(pkg_path_for core/openssl)" \
    -Dpython-bindings=ON

  cmake --build build -j"$(nproc)"
}

do_install() {
  # Installs everything except the python module correctly under
  # $pkg_prefix; also writes a stray copy of the module to the studio's
  # real /lib/pythonX.Y/site-packages (see comment above), which is
  # harmless -- nothing reads from there.
  cmake --install build

  local dest="${pkg_prefix}$(_python_site_packages)"
  mkdir -p "$dest"
  cp build/bindings/python/libtorrent*.so "$dest/"
}
