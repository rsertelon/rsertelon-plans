pkg_name=opentracker
pkg_origin=rsertelon
pkg_version="1.0.0"
pkg_upstream_url="https://erdgeist.org/arts/software/opentracker/"
pkg_description="An Open Source bittorrent tracker"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('Beerware')
pkg_deps=(
  core/glibc
  rsertelon/libowfat
  rsertelon/zlib-static
)
pkg_build_deps=(
  core/gcc
  core/git
  core/make
)
pkg_bin_dirs=(bin)

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  pushd "$HAB_CACHE_SRC_PATH"
    rm -rf $pkg_dirname
    git clone https://erdgeist.org/gitweb/opentracker $pkg_dirname
  popd
}

do_build() {
  pushd $HAB_CACHE_SRC_PATH/$pkg_dirname
    make
  popd
}

do_install() {
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/opentracker $pkg_prefix/bin/
  cp $HAB_CACHE_SRC_PATH/$pkg_dirname/opentracker.debug $pkg_prefix/bin/
}
