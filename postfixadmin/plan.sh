pkg_name=postfixadmin
pkg_origin=rsertelon
pkg_version="3.3.16"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="http://postfixadmin.sourceforge.net/"
pkg_description="Postfix Admin is a web based interface to configure and manage a Postfix based email server for many users."
pkg_source="https://github.com/postfixadmin/postfixadmin/archive/refs/tags/postfixadmin-${pkg_version}.tar.gz"
pkg_dirname="postfixadmin-postfixadmin-${pkg_version}"
pkg_shasum="586934d5309f0bdafe5e476d1c6a5cc8f439128eaf87e0d0c9f3cc493e886519"

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