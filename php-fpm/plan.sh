pkg_name=php-fpm
pkg_origin=rsertelon
pkg_version="0.2.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('Apache-2.0')
pkg_source=""
pkg_upstream_url="https://github.com/rsertelon/rsertelon-plans"

pkg_svc_user="hab"
pkg_svc_group="hab"

pkg_deps=(
  # PHP 7.4 breaks baikal's admin (at least)
  # Until it's compatible, using 7.3
  core/php/7.3.10
  core/readline
)

pkg_exports=(
  [address]=bind.address
  [port]=bind.port
)

do_build(){
  return 0
}

do_install() {
  return 0
}