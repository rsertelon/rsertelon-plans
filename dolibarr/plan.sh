pkg_origin=rsertelon
pkg_name=dolibarr$index
pkg_version="23.0.3"
pkg_description="Dolibarr ERP & CRM is a modern software package that helps manage your organization's activity (contacts, suppliers, invoices, orders, stocks, agenda…)."
pkg_upstream_url="https://www.dolibarr.org/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0-or-later")
pkg_source="https://github.com/Dolibarr/dolibarr/archive/refs/tags/${pkg_version}.tar.gz"
pkg_shasum="01e6fa4631ba6cc6aa5843906fa3a92b016d3280f8c924fce5aba164d29fdb72"
pkg_dirname=dolibarr-${pkg_version}
pkg_filename="dolibarr-${pkg_version}.tar.gz"

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

do_strip() {
  return 0
}