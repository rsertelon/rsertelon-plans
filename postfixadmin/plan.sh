pkg_name=postfixadmin
pkg_origin=rsertelon
pkg_version="4.0.4"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="http://postfixadmin.sourceforge.net/"
pkg_description="Postfix Admin is a web based interface to configure and manage a Postfix based email server for many users."
pkg_source="https://github.com/postfixadmin/postfixadmin/archive/refs/tags/postfixadmin-${pkg_version}.tar.gz"
pkg_dirname="postfixadmin-postfixadmin-${pkg_version}"
pkg_shasum="8c66ab852042600be119a2dbff4c97530dea3039c5cf034d090dc12baa134e49"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

pkg_build_deps=(
  rsertelon/composer-82
)

pkg_binds=(
  [php]="address port"
)

do_build(){
  COMPOSER_ALLOW_SUPERUSER=1 composer i --no-interaction
}

do_install() {
  mkdir -p "${pkg_prefix}/postfixadmin/templates_c"
  cp -r * "${pkg_prefix}/postfixadmin/"
}

do_strip() {
  return 0
}
