pkg_name=ampache
pkg_origin=rsertelon
pkg_version="7.9.6"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("AGPL-3.0")
pkg_upstream_url="http://ampache.org/"
pkg_description="A web based audio/video streaming application and file manager allowing you to access your music & videos from anywhere, using almost any internet enabled device."
pkg_source="https://github.com/ampache/ampache/archive/${pkg_version}.tar.gz"
pkg_shasum="e213f918d9f99970a09b3b7230f00aac02bf9f21269399d274e01429f1743069"
pkg_filename="${pkg_version}.tar.gz"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

pkg_build_deps=(
  core/coreutils
  core/node18
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
  ln -s "$(pkg_path_for core/coreutils)/bin/env" /usr/bin/env

  mkdir -p "${pkg_prefix}/ampache"
  cp -r * "${pkg_prefix}/ampache/"
  cd $pkg_prefix/ampache

  rm -r docker*
  rm -r docs*
  rm -r tests/
  rm phpstan*
  rm phpunit.xml

  COMPOSER_ALLOW_SUPERUSER=1 composer install --no-interaction --no-dev --prefer-source

  npm install
  npm run build

  rm /usr/bin/env
}

do_strip() {
  return 0
}
