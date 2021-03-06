pkg_name=rainloop
pkg_origin=rsertelon
pkg_version="1.15.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("RainLoop Software License")
pkg_upstream_url="http://www.rainloop.net/"
pkg_description="Simple, modern & fast web-based email client"
pkg_source="https://github.com/RainLoop/rainloop-webmail/releases/download/v${pkg_version}/rainloop-${pkg_version}.zip"
pkg_shasum="d18f4def23bf9eed2518b6f5332098410ee33ec70887c6dc50fb5fc058e941e6"
pkg_dirname="rainloop"

pkg_build_deps=(
  core/coreutils
)

pkg_deps=(
  core/nginx
)

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_binds=(
  [php]="address port"
)

do_build(){
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/rainloop/"
  mkdir -p "${pkg_prefix}/rainloop/rainloop"
  mkdir -p "${pkg_prefix}/rainloop/data"

  cp ../index.php "${pkg_prefix}/rainloop/"
  cp -r * "${pkg_prefix}/rainloop/rainloop"
  cp ../data/* "${pkg_prefix}/rainloop/data/"
}