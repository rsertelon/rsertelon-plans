pkg_name=composer-82
pkg_origin=rsertelon
pkg_version=2.8.11
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('MIT')
pkg_upstream_url="https://getcomposer.org/"
pkg_description="Dependency Manager for PHP"
pkg_source="https://getcomposer.org/download/${pkg_version}/composer.phar"
pkg_filename="composer.phar"
pkg_shasum="257a969e9a9d27e0e45cfe954835c17a76033ba84a388e0f472db83eded65a8b"
pkg_deps=(
  rsertelon/php-82
  core/git
)
pkg_bin_dirs=(bin)

do_unpack(){
  return 0
}

do_build() {
  return 0
}

do_check() {
  "$(pkg_path_for rsertelon/php-82)"/bin/php "../${pkg_filename}" --version 2>&1 | grep -q ${pkg_version}
}

do_install() {
  install -vDm755 "../${pkg_filename}" "${pkg_prefix}/bin/${pkg_filename}"

  cat<<EOF > "${pkg_prefix}/bin/composer"
#!/bin/sh
"$(pkg_path_for rsertelon/php-82)"/bin/php "${pkg_prefix}/bin/${pkg_filename}" "\$@"
EOF
  chmod +x "${pkg_prefix}/bin/composer"
}
