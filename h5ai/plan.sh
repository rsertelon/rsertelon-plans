pkg_name=h5ai$index
pkg_origin=rsertelon
pkg_version=0.30.0
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('MIT')
pkg_description="modern HTTP web server index"
pkg_upstream_url="https://larsjung.de/h5ai/"
pkg_source="https://github.com/lrsjng/h5ai/releases/download/v${pkg_version}/h5ai-${pkg_version}.zip"
pkg_shasum="fe138305a61d72094beb8c507dab728020158e4b00dae695a60b9803babb3e30"
pkg_dirname="_h5ai"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/ffmpeg # for video thumbnails
  core/nginx
  core/tar # for multi downloads
)

pkg_binds=(
  [php]="address port"
)

do_build() {
    return 0
}

do_install() {
    dest="${pkg_prefix}/_h5ai"
    mkdir $dest
    cp -R * $dest
}