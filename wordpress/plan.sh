pkg_origin=rsertelon
pkg_name=wordpress$index
pkg_version="7.1"
pkg_description="Blog Tool, Publishing Platform and CMS"
pkg_upstream_url="https://www.wordpress.org/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0")
pkg_source="https://wordpress.org/wordpress-${pkg_version}.tar.gz"
pkg_shasum="05a5f89138f632b7329f1202f2a0553c5f7fe4daf8e4b9ca7ebae9b9466b9e86"
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