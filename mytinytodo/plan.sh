pkg_name=mytinytodo
pkg_origin=rsertelon
pkg_version="1.6.2"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="https://www.mytinytodo.net"
pkg_description="Simple way to manage your todo list in AJAX style. "
pkg_filename="mytinytodo-v${pkg_version}.zip"
pkg_source="https://github.com/maxpozdeev/mytinytodo/releases/download/v${pkg_version}/mytinytodo-v${pkg_version}.zip"
pkg_dirname="mytinytodo"
pkg_shasum="59f3508664d83da71452d0955423f2e7636be713bd906dd4ef9ac90560d75075"

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