pkg_name=postfixadmin
pkg_origin=rsertelon
pkg_version="3.2.4"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="http://postfixadmin.sourceforge.net/"
pkg_description="Postfix Admin is a web based interface to configure and manage a Postfix based email server for many users."
pkg_source="https://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${pkg_version%.*}/postfixadmin-${pkg_version}.tar.gz"
pkg_dirname="postfixadmin-${pkg_version}"
pkg_shasum="6d5b27012ce18b6dd257eb690d7d124781cf9ab44209511d49efb9ccd6ea27f1"

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
  mkdir -p "${pkg_prefix}/postfixadmin/templates_c"
  cp -r * "${pkg_prefix}/postfixadmin/"
}