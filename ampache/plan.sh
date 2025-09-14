pkg_name=ampache
pkg_origin=rsertelon
pkg_version="7.3.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("AGPL-3.0")
pkg_upstream_url="http://ampache.org/"
pkg_description="A web based audio/video streaming application and file manager allowing you to access your music & videos from anywhere, using almost any internet enabled device."
pkg_source="https://github.com/ampache/ampache/archive/${pkg_version}.tar.gz"
pkg_shasum="9513bfc5c91530615c124cb79e1ed83e5d48fbe8f99f554eb7522bbc9bef4202"
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

  rm -rf vendor/* public/lib/components/*
  rm -r docker/

  composer install --no-interaction --no-dev --prefer-source

  npm install
  npm run build

  rm /usr/bin/env
}
