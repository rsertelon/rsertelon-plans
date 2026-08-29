pkg_name=roundcube
pkg_origin=rsertelon
pkg_version="1.7.1"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-2.0+")
pkg_upstream_url="https://roundcube.net"
pkg_description="Open source webmail software"
pkg_source="https://github.com/roundcube/roundcubemail/releases/download/${pkg_version}/roundcubemail-${pkg_version}-complete.tar.gz"
pkg_shasum="1e0382bcefd627ab0b6285d3181ddfba5b444fdcf6d49f33f5ea15fbf97864ef"
pkg_filename="roundcubemail-${pkg_version}-complete.tar.gz"
pkg_dirname="roundcubemail-${pkg_version}"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

pkg_build_deps=(
)

pkg_binds=(
  [php]="address port"
)

do_build(){
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/roundcube"
  cp -r * "${pkg_prefix}/roundcube/"
}

do_strip() {
  return 0
}
