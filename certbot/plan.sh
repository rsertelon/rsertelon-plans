pkg_name=certbot
pkg_origin=rsertelon
pkg_version=2.6.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license='Apache-2.0'
pkg_upstream_url='https://certbot.eff.org'
pkg_description='The Certbot LetsEncrypt client.'
pkg_deps=(
  'core/bash'
  'core/findutils'
  'core/python'
)
pkg_plugins=(
  'dns-rfc2136'
)
pkg_bin_dirs=(bin)

do_prepare() {
  python -m venv "$pkg_prefix"
  source "${pkg_prefix}/bin/activate"
  python -m pip install -U pip
}

do_build() {
  return 0
}

do_install() {
  for plugin in ${pkg_plugins[@]}
  do
    pip install "$pkg_name-$plugin==$pkg_version"
  done
}

do_strip() {
  return 0
}