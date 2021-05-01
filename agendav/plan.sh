pkg_name=agendav
pkg_origin=rsertelon
pkg_version="2.4.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0")
pkg_description="AgenDAV is an open source multilanguage CalDAV web client which features a rich AJAX interface with shared calendars support"
pkg_upstream_url="http://agendav.org/"
pkg_source="https://github.com/agendav/agendav/releases/download/${pkg_version}/agendav-${pkg_version}.tar.gz"
pkg_shasum="02b7c88cd5353503cc36f26b0b55f0aa72e17b680f41f907a59d4815403ff98b"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

pkg_binds=(
  [php]="address port"
)

do_build(){
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/agendav/"
  cp -r * "${pkg_prefix}/agendav/"
}