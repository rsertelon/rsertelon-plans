pkg_name=deluge-web
pkg_origin=rsertelon
pkg_version="0.1.0"
pkg_upstream_url="http://deluge-torrent.org/"
pkg_description="Web UI for rsertelon/deluge"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('GPL-3.0')
pkg_deps=(
  rsertelon/deluge
)

pkg_svc_user="hab"
pkg_svc_group="hab"

do_build() {
  return 0
}

do_install() {
  return 0
}
