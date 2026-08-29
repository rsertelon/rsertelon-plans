pkg_origin=rsertelon
pkg_name=wordpress$index
pkg_version="6.9.7"
pkg_description="Blog Tool, Publishing Platform and CMS"
pkg_upstream_url="https://www.wordpress.org/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0")
pkg_source="https://wordpress.org/wordpress-${pkg_version}.tar.gz"
pkg_shasum="11fd65eccbf4dd5de5ecb3724b55f92c56d6c1ea967497fe9374bcdd7a6fbda6"
pkg_dirname=wordpress

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

do_strip() {
  return 0
}