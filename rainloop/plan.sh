pkg_name=rainloop
pkg_origin=rsertelon
pkg_version="1.17.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("MIT")
pkg_upstream_url="http://www.rainloop.net/"
pkg_description="Simple, modern & fast web-based email client"
pkg_source="https://github.com/RainLoop/rainloop-webmail/releases/download/v${pkg_version}/rainloop-legacy-${pkg_version}.zip"
pkg_shasum="782dcabacadab5d7176f7701dd23319a040b2cfbf974fac6df068600cf69c50a"
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