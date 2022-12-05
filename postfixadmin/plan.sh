pkg_name=postfixadmin
pkg_origin=rsertelon
pkg_version="3.3.12"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="http://postfixadmin.sourceforge.net/"
pkg_description="Postfix Admin is a web based interface to configure and manage a Postfix based email server for many users."
pkg_source="https://github.com/postfixadmin/postfixadmin/archive/refs/tags/postfixadmin-${pkg_version}.tar.gz"
pkg_dirname="postfixadmin-postfixadmin-${pkg_version}"
pkg_shasum="906d9d9eba7140562445e3e4009b50db8d05a178f4f685fbfa8230a2b95c901b"

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