pkg_origin=rsertelon
pkg_name=phpmyadmin
pkg_version="4.9.5"
pkg_description="phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web."
pkg_upstream_url="https://www.phpmyadmin.net/"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0")
pkg_dirname="phpMyAdmin-${pkg_version}-all-languages"
pkg_filename="${pkg_dirname}.tar.xz"
pkg_source="https://files.phpmyadmin.net/phpMyAdmin/${pkg_version}/${pkg_filename}"
pkg_shasum="e02823e7844bc17aa6393e1acfed6970f5a3688fe8d0c693e74670d8fed9ecd4"

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