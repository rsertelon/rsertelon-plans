pkg_name=baikal
pkg_origin=rsertelon
pkg_version="0.9.2"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0")
pkg_description="Baïkal is a Cal and CardDAV server, based on sabre/dav, that includes an administrative interface for easy management."
pkg_upstream_url="http://sabre.io/baikal/"
pkg_source="https://github.com/sabre-io/Baikal/releases/download/${pkg_version}/baikal-${pkg_version}.zip"
pkg_shasum="5feb8488c74fe6b625680654f3d51cdb080dcc6180c1b558543cb25f18f38c65"
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