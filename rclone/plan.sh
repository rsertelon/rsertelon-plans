pkg_name=rclone
pkg_origin=rsertelon
pkg_version=1.71.0
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license='MIT'
pkg_upstream_url='https://rclone.org/'
pkg_description='Rclone syncs your files to cloud storage'
pkg_dirname="rclone-v${pkg_version}-linux-amd64"
pkg_filename="${pkg_dirname}.zip"
pkg_source="https://downloads.rclone.org/v${pkg_version}/${pkg_filename}"
pkg_shasum="3ddbcfd535ef2e6eb00cd006831766537f1fef1c8baeed1ee4632e7bcc699e93"
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