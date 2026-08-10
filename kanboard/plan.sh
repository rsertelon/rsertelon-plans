pkg_name=kanboard
pkg_origin=rsertelon
pkg_version="1.2.53"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("MIT")
pkg_upstream_url="https://kanboard.org/"
pkg_description="Kanboard is a free and open source Kanban project management software."
pkg_source="https://github.com/kanboard/kanboard/archive/refs/tags/v${pkg_version}.tar.gz"
pkg_shasum="12ad42a26c7eecba1d156fa6b05af0575e07232bb72fad64b232097df6e9ec9f"

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
  mkdir -p "${pkg_prefix}/kanboard/"

  rm -r data
  rm docker*
  rm CONTRIBUTING.md
  rm web.config

  cp -r * "${pkg_prefix}/kanboard/"
}

do_strip() {
  return 0
}
