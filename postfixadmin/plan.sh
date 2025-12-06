pkg_name=postfixadmin
pkg_origin=rsertelon
pkg_version="4.0.1"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="http://postfixadmin.sourceforge.net/"
pkg_description="Postfix Admin is a web based interface to configure and manage a Postfix based email server for many users."
pkg_source="https://github.com/postfixadmin/postfixadmin/archive/refs/tags/postfixadmin-${pkg_version}.tar.gz"
pkg_dirname="postfixadmin-postfixadmin-${pkg_version}"
pkg_shasum="41e096d37f4531af0f0ee63d2288facf0be4c834ff4d2fceca54682c2a7ed113"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

pkg_build_deps=(
  core/composer
)

pkg_binds=(
  [php]="address port"
)

do_build(){
  composer i --no-interaction
}

do_install() {
  mkdir -p "${pkg_prefix}/postfixadmin/templates_c"
  cp -r * "${pkg_prefix}/postfixadmin/"
}