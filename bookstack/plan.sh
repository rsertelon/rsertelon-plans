pkg_name=bookstack
pkg_origin=rsertelon
pkg_version="26.05.4"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("MIT")
pkg_upstream_url="https://www.bookstackapp.com/"
pkg_description="BookStack is a simple, self-hosted, easy-to-use platform for organising and storing information."
pkg_source="https://codeberg.org/bookstack/bookstack/archive/v${pkg_version}.tar.gz"
pkg_shasum="7322ef1f196cd6ab0f78abf4c01553d2d28f1bb61428c9e61d100615d14a6d36"
pkg_dirname="${pkg_name}"
pkg_filename="${pkg_name}-v${pkg_version}.tar.gz"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

pkg_build_deps=(
  rsertelon/composer-82
)

pkg_binds=(
  # PHP 8.2 minimum
  [php]="address port"
)

do_build(){
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/bookstack"
  cp -r * "${pkg_prefix}/bookstack/"
  cd $pkg_prefix/bookstack

  COMPOSER_ALLOW_SUPERUSER=1 composer install --no-interaction --no-dev
}

do_strip() {
  return 0
}