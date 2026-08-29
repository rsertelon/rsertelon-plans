pkg_name=agendav
pkg_origin=rsertelon
pkg_version="3.3.1"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0")
pkg_description="AgenDAV is an open source multilanguage CalDAV web client which features a rich AJAX interface with shared calendars support"
pkg_upstream_url="https://github.com/agendav/agendav"
pkg_source="https://github.com/agendav/agendav/releases/download/${pkg_version}/agendav-${pkg_version}.tar.gz"
pkg_shasum="aec1038845ea9b489f575028d092fb7ef3dbee7dcf302783a3f6d383e7473030"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
  rsertelon/php-85
)

pkg_build_deps=(
  core/patch
)

pkg_binds=(
  [php]="address port"
)

do_build() {
  # TODO: replace shebang php in bin/agendavcli to use rsertelon/php-85 php.
  php_path="$(pkg_path_for rsertelon/php-85)/bin/php"
  sed -i 's@#!/usr/bin/php@#!'"$php_path"'@' bin/agendavcli

  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/agendav/"
  cp -r * "${pkg_prefix}/agendav/"
}

do_strip() {
  return 0
}