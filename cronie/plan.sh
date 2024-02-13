pkg_name=cronie
pkg_origin=rsertelon
pkg_version="1.7.1"
pkg_upstream_url="https://github.com/cronie-crond/cronie"
pkg_description="Cronie contains the standard UNIX daemon crond that runs specified programs at scheduled times and related tools."
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('GPL-2')
pkg_source="https://github.com/cronie-crond/cronie/releases/download/cronie-${pkg_version}/cronie-${pkg_version}.tar.gz"
pkg_shasum="78033100c24413f0c40f93e6138774d6a4f55bc31050567b90db45a2f9f1b954"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/gcc
  core/make
)
pkg_bin_dirs=(bin sbin)

pkg_svc_user="root"
pkg_svc_group="root"

do_build() {
  SPOOL_DIR="${pkg_svc_data_path}/crontabs" \
  ./configure --prefix="${pkg_prefix}" \
    --runstatedir="${pkg_svc_var_path}" \
    --disable-syscrontab \
    --disable-anacron \
    --enable-pie \
    --enable-relro \
    --with-daemon_username=hab \
    --with-daemon_groupname=hab

  make
}

do_install() {
  do_default_install

  mkdir -p ${pkg_prefix}/etc/cron.d
}