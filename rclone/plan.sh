pkg_name=rclone
pkg_origin=rsertelon
pkg_version=1.75.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license=('MIT')
pkg_upstream_url='https://rclone.org/'
pkg_description='Rclone syncs your files to cloud storage'
pkg_dirname="rclone-v${pkg_version}-linux-amd64"
pkg_filename="${pkg_dirname}.zip"
pkg_source="https://downloads.rclone.org/v${pkg_version}/${pkg_filename}"
pkg_shasum="aa2804e08f48250e71009c727124b6341cd0288465804a9a09d14663cabafbaa"
pkg_bin_dirs=(bin)

do_build() {
  return 0
}

do_install() {
  cp rclone ${pkg_prefix}/bin
}

do_strip() {
  return 0
}