pkg_name=libxcrypt-compat
pkg_origin=rsertelon
pkg_version="4.5.2"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_description="\
libxcrypt built for glibc ABI compatibility, providing libcrypt.so.1. \
glibc dropped its own libcrypt.so.1 in 2.38, so binaries built against \
older glibc (or otherwise expecting libcrypt.so.1) need this to run.\
"
pkg_upstream_url="https://github.com/besser82/libxcrypt"
pkg_license=('LGPL-2.1-or-later')
pkg_dirname="libxcrypt-${pkg_version}"
pkg_filename="${pkg_dirname}.tar.xz"
pkg_source="https://github.com/besser82/libxcrypt/releases/download/v${pkg_version}/${pkg_filename}"
pkg_shasum="71513a31c01a428bccd5367a32fd95f115d6dac50fb5b60c779d5c7942aec071"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/gcc
  core/make
  core/perl
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)


do_build() {
  # --enable-obsolete-api=glibc builds libcrypt.so.1 with the same symbol
  # versions (GLIBC_2.2.5 et al.) as glibc's original libcrypt, so binaries
  # linked against it keep working unmodified.
  ./configure \
    --prefix="$pkg_prefix" \
    --libdir="$pkg_prefix/lib" \
    --enable-obsolete-api=glibc \
    --disable-static

  make
}

do_install() {
  make install
}
