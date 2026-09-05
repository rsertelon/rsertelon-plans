pkg_name=certbot
pkg_origin=rsertelon
pkg_version=5.7.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license=('Apache-2.0')
pkg_upstream_url='https://certbot.eff.org'
pkg_description='The Certbot LetsEncrypt client.'
pkg_deps=(
  'core/bash'
  'core/findutils'
  'core/gcc-libs'
  'core/python'
)
pkg_build_deps=(
  'core/patchelf'
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

  find "$pkg_prefix/lib" -type f -name "*.so" \
    -exec patchelf --set-rpath "${LD_RUN_PATH}" {} \;
}

do_strip() {
  return 0
}