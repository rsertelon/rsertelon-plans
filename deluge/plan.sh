pkg_name=deluge
pkg_origin=rsertelon
pkg_version="2.0.3"
pkg_upstream_url="http://deluge-torrent.org/"
pkg_description="Lighweight cross platform BitTorrent client"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('GPL-3.0')
pkg_source="https://ftp.osuosl.org/pub/deluge/source/${pkg_version%.*}/deluge-${pkg_version}.tar.xz"
pkg_shasum="7e7ae8e6ca2a2bf0d487227cecf81e27332f0b92b567cc2bda38e47d859da891"
pkg_deps=(
  core/glibc
  core/libffi
  core/openssl
  core/zlib
  rsertelon/libtorrent
  rsertelon/python # Has lzma support
)
pkg_build_deps=(
  core/gcc
)
pkg_bin_dirs=(bin)

pkg_svc_user="root"
pkg_svc_group="root"

do_prepare() {
  python -m venv "$pkg_prefix"
  source "${pkg_prefix}/bin/activate"
}

do_build() {
  pip install --upgrade setuptools # fixes missing setuptools_rust
  python setup.py build
}

do_install() {
  python setup.py install
}

do_strip() {
  return 0
}