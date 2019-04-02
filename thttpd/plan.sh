pkg_name=thttpd
pkg_origin=rsertelon
pkg_version="2.29"
pkg_upstream_url="http://acme.com/software/thttpd"
pkg_description="thttpd is a simple, small, portable, fast, and secure HTTP server. "
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('BSD-2-Clause')
pkg_source="http://acme.com/software/thttpd/thttpd-${pkg_version}.tar.gz"
pkg_shasum="99c09f47da326b1e7b5295c45549d2b65534dce27c44812cf7eef1441681a397"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/diffutils
  core/gcc
  core/make
  core/sed
)
pkg_bin_dirs=(bin)

do_prepare() {
  sed -i "s:@sbindir@:/bin:" Makefile.in
}

do_install() {
  DESTDIR="${pkg_prefix}" make installthis
}
