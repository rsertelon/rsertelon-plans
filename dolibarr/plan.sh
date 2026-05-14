pkg_origin=rsertelon
pkg_name=dolibarr$index
pkg_version="23.0.2"
pkg_description="Dolibarr ERP & CRM is a modern software package that helps manage your organization's activity (contacts, suppliers, invoices, orders, stocks, agenda…)."
pkg_upstream_url="https://www.dolibarr.org/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0-or-later")
pkg_source="https://github.com/Dolibarr/dolibarr/archive/refs/tags/${pkg_version}.tar.gz"
pkg_shasum="10754a727b2d82a5aa3881d221ffdfdd6f0b265761b7e6b016a6b588bcea7fe1"
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