pkg_name=libtorrent
pkg_origin=rsertelon
pkg_version="1.2.11"
pkg_upstream_url="http://libtorrent.org/"
pkg_description="Feature complete C++ BitTorrent implementation"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('BSD-2-Clause')
pkg_source="https://github.com/arvidn/libtorrent/releases/download/v${pkg_version}/libtorrent-rasterbar-${pkg_version}.tar.gz"
pkg_shasum="cb6a9cc3c9a9e485174394baa82744cef8415d23a357f5721dcc9ee7622c4efb"
pkg_dirname="libtorrent-rasterbar-${pkg_version}"
pkg_deps=(
    core/gcc-libs
    core/glibc
    core/libiconv
    core/openssl
    core/zlib
    rsertelon/boost
    core/python
)
pkg_build_deps=(
    core/diffutils
    core/file
    core/gcc
    core/make
    core/pkg-config
)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_pconfig_dirs=(lib/pkgconfig)

do_prepare() {
  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
    _clean_file=true
  fi
}

do_setup_environment() {
    push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python3.9/site-packages"
}

do_build() {
    ./configure --prefix=$pkg_prefix \
        --with-boost-libdir=$(pkg_path_for rsertelon/boost)/lib \
        --with-openssl=$(pkg_path_for core/openssl) \
        --enable-python-binding \
        --with-libiconv \
        --with-libiconv-prefix=$(pkg_path_for core/libiconv)
    make -j"$(nproc)"
}

do_install() {
    make install
}

do_check() {
    # Not passing yet
    make check
}

do_end() {
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
}
