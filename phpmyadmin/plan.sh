pkg_origin=rsertelon
pkg_name=phpmyadmin
pkg_version="4.9.2"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0")
pkg_source="https://files.phpmyadmin.net/phpMyAdmin/${pkg_version}/phpMyAdmin-${pkg_version}-all-languages.zip"
pkg_filename="phpMyAdmin-${pkg_version}-all-languages.zip"
pkg_dirname="phpMyAdmin-${pkg_version}-all-languages"
pkg_description="phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web."
pkg_upstream_url="https://www.phpmyadmin.net/"
pkg_shasum="82c2bb365804168f61d32d4bf7a00afeaf2509aaedd7e79433c705e67fa0a4ca"

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