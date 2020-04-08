pkg_name=reverse-proxy
pkg_origin=rsertelon
pkg_version="0.2.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0")
pkg_description="TLS Reverse proxy for multiple services"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

do_build(){
  return 0
}

do_install() {
  return 0
}