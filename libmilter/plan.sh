pkg_name=libmilter
pkg_origin=rsertelon
pkg_version="8.18.2"
pkg_upstream_url="https://www.proofpoint.com/us/products/open-source-email-solution"
pkg_description="The Sendmail milter library"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('Sendmail')
pkg_source="ftp://ftp.sendmail.org/pub/sendmail/sendmail.${pkg_version}.tar.gz"
pkg_shasum="1a085faa8ace52cffde2f5e9bc611bdb5f81481caaabf46f0437b719ca089d2f"
pkg_dirname="sendmail-${pkg_version}"

pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/gcc
  core/m4
  core/make
  core/patch
)

pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  # Patch for creating a shared lib. It comes from Gentoo's ebuild for libmilter at
  # https://gitweb.gentoo.org/repo/gentoo.git/tree/mail-filter/libmilter
  patch -p1 -i "$PLAN_CONTEXT"/patches/limilter-sharedlib.patch

  pushd libmilter
  make
  popd
}

do_install() {
  export pkg_prefix
  pushd libmilter
  make install
  popd
}