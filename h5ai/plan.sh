pkg_name=h5ai$index
pkg_origin=rsertelon
pkg_version=0.29.2
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('MIT')
pkg_description="modern HTTP web server index"
pkg_upstream_url="https://larsjung.de/h5ai/"
pkg_source="https://release.larsjung.de/h5ai/h5ai-${pkg_version}.zip"
pkg_shasum="612acd8cc724ab42c5266f7b9966a0212b561331d8770b5609891edb5cb69a8b"
pkg_dirname="_h5ai"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
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