pkg_name=postfixadmin
pkg_origin=rsertelon
pkg_version="3.3.8"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="http://postfixadmin.sourceforge.net/"
pkg_description="Postfix Admin is a web based interface to configure and manage a Postfix based email server for many users."
pkg_filename="PostfixAdmin%20${pkg_version}.tar.gz"
pkg_source="https://downloads.sourceforge.net/project/postfixadmin/postfixadmin-${pkg_version}/${pkg_filename}"
pkg_dirname="postfixadmin-postfixadmin-7d04685"
pkg_shasum="0a99da09a24ebe046075d2706845dc32fe96f2711c22085b29d95c6b6eaf59ed"

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