pkg_name=postfixadmin
pkg_origin=rsertelon
pkg_version="3.2"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="http://postfixadmin.sourceforge.net/"
pkg_description="Postfix Admin is a web based interface to configure and manage a Postfix based email server for many users."
pkg_source="https://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${pkg_version}/postfixadmin-${pkg_version}.tar.gz"
pkg_dirname="postfixadmin-${pkg_version}"
pkg_shasum="866d4c0ca870b2cac184e5837a4d201af8fcefecef09bc2c887a6e017a00cefe"

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
  mkdir -p "${pkg_prefix}/postfixadmin/"
  cp -r * "${pkg_prefix}/postfixadmin/"
}