pkg_name=mytinytodo
pkg_origin=rsertelon
pkg_version="1.6.10"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="https://www.mytinytodo.net"
pkg_description="Simple way to manage your todo list in AJAX style. "
pkg_filename="mytinytodo-v${pkg_version}.zip"
pkg_source="https://github.com/maxpozdeev/mytinytodo/releases/download/v${pkg_version}/mytinytodo-v${pkg_version}.zip"
pkg_dirname="mytinytodo"
pkg_shasum="70c7c623718b2735f5422379098a3457888b231990a4f447232490021d43a1e4"

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
  mkdir -p "${pkg_prefix}/mytinytodo"
  cp -R * "${pkg_prefix}/mytinytodo/"
}