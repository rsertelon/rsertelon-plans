pkg_name=rclone
pkg_origin=rsertelon
pkg_version=1.74.2
pkg_maintainer='Romain Sertelon <romain@sertelon.fr>'
pkg_license='MIT'
pkg_upstream_url='https://rclone.org/'
pkg_description='Rclone syncs your files to cloud storage'
pkg_dirname="rclone-v${pkg_version}-linux-amd64"
pkg_filename="${pkg_dirname}.zip"
pkg_source="https://downloads.rclone.org/v${pkg_version}/${pkg_filename}"
pkg_shasum="72a806370072015ccbe4d81bcd348cc5eaf3beca6c65ba693fd43fb31fcca5b1"
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