pkg_name=wiki-js
pkg_origin=rsertelon
pkg_version="2.5.214"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("AGPL-3.0")
pkg_upstream_url="https://js.wiki/"
pkg_description="The most powerful and extensible open source Wiki software."
pkg_source="https://github.com/Requarks/wiki/releases/download/${pkg_version}/wiki-js.tar.gz"
pkg_shasum="117cac1e1109e352cc2d1b9e12816bf9213d49d2445cc64b849412bd9813a138"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/node
)

do_unpack() {
  mkdir -p "$HAB_CACHE_SRC_PATH/$pkg_dirname"
  tar zxf "$HAB_CACHE_SRC_PATH/$pkg_filename" -C "$HAB_CACHE_SRC_PATH/$pkg_dirname"
}

do_build(){
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/wiki-js"
  cp -r * "${pkg_prefix}/wiki-js/"
}

do_strip() {
  return 0
}