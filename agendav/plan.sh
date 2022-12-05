pkg_name=agendav
pkg_origin=rsertelon
pkg_version="2.6.0"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=("GPL-3.0")
pkg_description="AgenDAV is an open source multilanguage CalDAV web client which features a rich AJAX interface with shared calendars support"
pkg_upstream_url="https://github.com/agendav/agendav"
pkg_source="https://github.com/agendav/agendav/releases/download/${pkg_version}/agendav-${pkg_version}.tar.gz"
pkg_shasum="af72c07886e30d2443ce9587992f59c78fad5ab4a069e311286e1e7216db895e"

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(
  core/nginx
)

pkg_build_deps=(
  core/patch
)

pkg_binds=(
  [php]="address port"
)

do_build(){
  # Patch to fix a bug where agendav is unable to fetch and display events
  # https://github.com/agendav/agendav/issues/289
  patch --binary -p1 -i "$PLAN_CONTEXT"/patches/000_date_helper_error_while_fetching_events.patch

  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/agendav/"
  cp -r * "${pkg_prefix}/agendav/"
}