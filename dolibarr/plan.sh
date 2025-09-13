pkg_origin=rsertelon
pkg_name=dolibarr
pkg_version="18.0.8"
pkg_description="Dolibarr ERP & CRM is a modern software package that helps manage your organization's activity (contacts, suppliers, invoices, orders, stocks, agenda…)."
pkg_upstream_url="https://www.dolibarr.org/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0-or-later")
pkg_source="https://github.com/Dolibarr/dolibarr/archive/refs/tags/${pkg_version}.tar.gz"
pkg_shasum="9a0118def282d6e33cd248cbd0c0f9a45682d01ee1beaf38790b638afa2f2f70"
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