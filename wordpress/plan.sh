pkg_origin=rsertelon
pkg_name=wordpress
pkg_version="6.9"
pkg_description="Blog Tool, Publishing Platform and CMS"
pkg_upstream_url="https://www.wordpress.org/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0")
pkg_source="https://wordpress.org/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="5b36390233e32fef68cb5f66435bb32bdd50e0b3dfa5750aceb2de3c5993d720"
pkg_dirname=$pkg_name

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/curl
  core/nginx
)

pkg_binds=(
  [php]="address port"
)

do_build(){
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/wordpress/"
  cp -r * "${pkg_prefix}/wordpress/"
}