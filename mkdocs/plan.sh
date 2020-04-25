pkg_name=mkdocs
pkg_origin=rsertelon
pkg_upstream_url="http://www.mkdocs.org/"
pkg_description="Project documentation with Markdown. "
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('BSD')
pkg_deps=(
  core/python
)
pkg_bin_dirs=(bin)

pkg_version() {
  pip --disable-pip-version-check search "$pkg_name" \
    | grep "^$pkg_name " \
    | cut -d'(' -f2 \
    | cut -d')' -f1
}

do_before() {
  update_pkg_version
}

do_prepare() {
  python -m venv "$pkg_prefix"
  source "${pkg_prefix}/bin/activate"
}

do_build() {
  return 0
}

do_install() {
  pip --disable-pip-version-check install "$pkg_name==$pkg_version"
}

do_strip() {
  return 0
}
