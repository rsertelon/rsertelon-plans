pkg_name=mytinytodo
pkg_origin=rsertelon
pkg_version="1.5"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="https://www.mytinytodo.net"
pkg_description="Simple way to manage your todo list in AJAX style. "
pkg_filename="mytinytodo-v${pkg_version}.zip"
pkg_source="https://github.com/maxpozdeev/mytinytodo/releases/download/v${pkg_version}/mytinytodo-v${pkg_version}.zip"
pkg_dirname="mytinytodo"
pkg_shasum="697287556e86657ddbc4c07f92b1e85e2f9b403d40aec8ced821173c154ebfd2"

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