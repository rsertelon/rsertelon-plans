pkg_name=baikal
pkg_origin=rsertelon
pkg_version="0.10.1"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0")
pkg_description="Baïkal is a Cal and CardDAV server, based on sabre/dav, that includes an administrative interface for easy management."
pkg_upstream_url="http://sabre.io/baikal/"
pkg_source="https://github.com/sabre-io/Baikal/releases/download/${pkg_version}/baikal-${pkg_version}.zip"
pkg_shasum="56eb176d98e68ada5af408beb10ffd97bd09c6b6ee59a398dbceff0be19f4df3"
pkg_dirname="baikal"

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
  mkdir -p "${pkg_prefix}/baikal/"
  cp -r * "${pkg_prefix}/baikal/"
}