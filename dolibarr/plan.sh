pkg_origin=rsertelon
pkg_name=dolibarr
pkg_version="18.0.6"
pkg_description="Dolibarr ERP & CRM is a modern software package that helps manage your organization's activity (contacts, suppliers, invoices, orders, stocks, agenda…)."
pkg_upstream_url="https://www.dolibarr.org/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0-or-later")
pkg_source="https://github.com/Dolibarr/dolibarr/archive/refs/tags/${pkg_version}.tar.gz"
pkg_shasum="555cd71c3cec365c80dc559415c92d1372dd29396d9d47c4150b2d9aa8f249f2"

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
  mkdir -p "${pkg_prefix}/dolibarr/"
  cp -r * "${pkg_prefix}/dolibarr/"
}