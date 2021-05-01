pkg_origin=rsertelon
pkg_name=phpmyadmin
pkg_version="5.1.0"
pkg_description="phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web."
pkg_upstream_url="https://www.phpmyadmin.net/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0")
pkg_dirname="phpMyAdmin-${pkg_version}-all-languages"
pkg_filename="${pkg_dirname}.tar.xz"
pkg_source="https://files.phpmyadmin.net/phpMyAdmin/${pkg_version}/${pkg_filename}"
pkg_shasum="aa8ccf357f672012384df34e1c2bc70147476761c8458a0dad6233497e142c68"

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
  mkdir -p "${pkg_prefix}/phpmyadmin/"
  cp -r * "${pkg_prefix}/phpmyadmin/"
}