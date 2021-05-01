pkg_name=baikal
pkg_origin=rsertelon
pkg_version="0.8.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0")
pkg_description="Baïkal is a Cal and CardDAV server, based on sabre/dav, that includes an administrative interface for easy management."
pkg_upstream_url="http://sabre.io/baikal/"
pkg_source="https://github.com/sabre-io/Baikal/releases/download/${pkg_version}/baikal-${pkg_version}.zip"
pkg_shasum="30f797785da2b37be785b0e5bffcff1c844b855c0f11c617358f99bb9457ddf4"
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