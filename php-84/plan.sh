pkg_name=php-84
pkg_origin=rsertelon
pkg_version=8.4.25
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("PHP-3.01")
pkg_upstream_url=http://php.net/
pkg_description="PHP is a popular general-purpose scripting language that is especially suited to web development."
pkg_source="https://www.php.net/distributions/php-${pkg_version}.tar.xz"
pkg_filename="php-${pkg_version}.tar.xz"
pkg_dirname="php-${pkg_version}"
pkg_shasum="dc1ad8b4109898d9db49744450403874858c23efc685b1032a50bd1e83906848"
pkg_deps=(
  core/bzip2
  core/coreutils
  core/curl
  core/glibc
  core/icu
  core/libidn2
  core/libjpeg-turbo
  core/libpng
  core/libxml2
  rsertelon/libzip
  core/openssl
  core/readline
  rsertelon/zip
  core/zlib
  core/gcc-libs
  core/oniguruma
  core/sqlite
  core/libpsl
  core/nghttp2
  core/zstd
)
pkg_build_deps=(
  core/autoconf
  core/bison
  core/gcc
  rsertelon/libgd
  core/make
  core/re2c
  core/pkg-config
)
pkg_bin_dirs=(bin sbin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_interpreters=(bin/php)

do_build() {
  ./configure --prefix="${pkg_prefix}" \
    --enable-fpm \
    --with-fpm-user=hab \
    --with-fpm-group=hab \
    --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --with-readline="$(pkg_path_for readline)" \
    --with-curl \
    --with-jpeg \
    --with-libxml \
    --with-openssl \
    --with-xmlrpc \
    --with-zip \
    --with-zlib \
    --with-bz2="$(pkg_path_for bzip2)" \
    --with-gettext="$(pkg_path_for glibc)" \
    --enable-bcmath \
    --enable-calendar \
    --enable-exif \
    --enable-mbstring \
    --enable-opcache \
    --enable-gd \
    --enable-intl

  make -j "$(nproc)"
}

do_install() {
  do_default_install

  # Modify PHP-FPM config so it will be able to run out of the box. To run a real
  # PHP-FPM application you would want to supply your own config with
  # --fpm-config <file>.
  mv "${pkg_prefix}/etc/php-fpm.conf.default" "${pkg_prefix}/etc/php-fpm.conf"
}

do_check() {
  make test
}
