pkg_name=resilio-sync
pkg_origin=rsertelon
pkg_version=2.7.2
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('Resilio Sync License')
pkg_upstream_url="https://www.resilio.com/platforms/desktop/"
pkg_source="https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz"
pkg_shasum="0e9e92eb0deeb9314e9676275e91fdce6d6296b352637e7dc59eecb03f2d593d"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/patchelf
)
pkg_bin_dirs=(bin)

pkg_svc_user="root"
pkg_svc_group="root"

do_build() {
  return 0
}

do_install() {
  cp $HAB_CACHE_SRC_PATH/rslsync $pkg_prefix/bin
  cp $HAB_CACHE_SRC_PATH/LICENSE.TXT $pkg_prefix/
  patchelf --interpreter "$(pkg_path_for glibc)/lib/ld-linux-x86-64.so.2" \
    --set-rpath "$LD_RUN_PATH" \
    $pkg_prefix/bin/rslsync
}

do_strip() {
  return 0
}