pkg_name=vaultwarden
pkg_origin=rsertelon
pkg_version="1.36.0"
pkg_upstream_url="https://github.com/dani-garcia/vaultwarden"
pkg_description="Unofficial Bitwarden compatible server written in Rust, formerly known as bitwarden_rs ."
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('AGPL-3.0')
pkg_deps=()
pkg_build_deps=(
  core/wget
)
pkg_bin_dirs=(bin)

do_prepare() {
  return 0
}

do_build() {
  rm -r ${HAB_CACHE_SRC_PATH}/${pkg_dirname}
  mkdir -p ${HAB_CACHE_SRC_PATH}/${pkg_dirname}
  cd ${HAB_CACHE_SRC_PATH}/${pkg_dirname}
  wget https://raw.githubusercontent.com/jjlin/docker-image-extract/main/docker-image-extract
  chmod +x docker-image-extract
  ./docker-image-extract vaultwarden/server:${pkg_version}-alpine
}

do_install() {
  cd ${HAB_CACHE_SRC_PATH}/${pkg_dirname}/output
  mv vaultwarden ${pkg_prefix}/bin/
  mv web-vault ${pkg_prefix}/
}
