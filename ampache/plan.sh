pkg_name=ampache
pkg_origin=rsertelon
pkg_version="4.4.3"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("AGPL-3.0")
pkg_upstream_url="http://ampache.org/"
pkg_description="A web based audio/video streaming application and file manager allowing you to access your music & videos from anywhere, using almost any internet enabled device."
pkg_source="https://github.com/ampache/ampache/archive/${pkg_version}.tar.gz"
pkg_shasum="978eb6e82fca9a632039f5498e0e391e65549e92a1d9bb9ff98ac20971ce12e9"
pkg_filename="${pkg_version}.tar.gz"

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
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/ampache"
  cp -r * "${pkg_prefix}/ampache/"
  cd $pkg_prefix/ampache

  composer install --prefer-source --no-interaction
}