pkg_name=deluge
pkg_origin=rsertelon
pkg_version="2.2.0"
pkg_upstream_url="http://deluge-torrent.org/"
pkg_description="Lighweight cross platform BitTorrent client"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('GPL-3.0')
pkg_source="https://ftp.osuosl.org/pub/deluge/source/${pkg_version%.*}/deluge-${pkg_version}.tar.xz"
pkg_shasum="b9ba272b5ba42aaf1c694e6c29628ab816cc1a700a37bac08aacb52571606acd"

# rencode (one of deluge's install_requires) has no prebuilt wheel for our
# Python version, so pip builds it from source -- but its build.py hardcodes
# `-march=native -mfma`, baking in whatever CPU the Habitat builder happens
# to have. That crashes with SIGILL on any target host missing those
# instructions. We fetch+patch it ourselves and build a portable wheel
# instead of letting pip do it as part of installing deluge's own wheel.
rencode_version="1.0.8"
rencode_dirname="rencode-${rencode_version}"
rencode_filename="${rencode_dirname}.tar.gz"
rencode_shasum="83b2d9b6d84adc35615b7a09b74279211abaaf57a578af10ad012455a99a7722"

pkg_deps=(
  core/glibc
  core/libffi
  core/openssl
  core/zlib
  rsertelon/libtorrent
  core/python
)
pkg_build_deps=(
  core/gcc
)
pkg_bin_dirs=(bin)

pkg_svc_user="root"
pkg_svc_group="root"

do_download() {
  do_default_download

  download_file "https://files.pythonhosted.org/packages/39/92/f724e1931548ce8e070554994007e184cedc2506335f02c8e7a7234aee95/${rencode_filename}" "$rencode_filename" "$rencode_shasum"
}

do_verify() {
  do_default_verify

  verify_file "$rencode_filename" "$rencode_shasum"
}

do_clean() {
  do_default_clean

  rm -rf "$HAB_CACHE_SRC_PATH/${rencode_dirname}"
}

do_unpack() {
  do_default_unpack

  unpack_file "$rencode_filename"

  # Drop the CPU-specific flags; keep the rest (all baseline on x86-64).
  sed -i 's/"-march=native", //; s/, "-mfma"//' \
    "$HAB_CACHE_SRC_PATH/${rencode_dirname}/build.py"
}

do_prepare() {
  python -m venv "$pkg_prefix"
  source "${pkg_prefix}/bin/activate"
}

do_build() {
  # Upgrade past whatever old setuptools the venv shipped with (fixes
  # missing setuptools_rust), but stay below 82: setuptools removed
  # pkg_resources there, which deluge itself still imports at runtime.
  pip install --upgrade "setuptools<82"

  # cython + poetry-core: rencode's own build backend.
  pip install --upgrade cython poetry-core
  pip wheel --no-deps -w dist "$HAB_CACHE_SRC_PATH/${rencode_dirname}"

  # `python setup.py build`/`install` don't resolve install_requires
  # (twisted, pyasn1, rencode, pyopenssl, pyxdg, mako, zope.interface...);
  # only pip does, so build a wheel here and let do_install() pip-install it.
  pip wheel --no-deps -w dist .
}

do_install() {
  # Both wheels together so pip's dependency resolution for deluge's
  # (unpinned) "rencode" requirement is satisfied by our patched build
  # instead of reaching out to PyPI for the unpatched one.
  pip install dist/*.whl
}

do_strip() {
  return 0
}