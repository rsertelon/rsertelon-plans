pkg_name=postfix
pkg_origin=core
pkg_version="3.5.12"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_description="Wietse Venema's mail server that started life at IBM research as an alternative to the widely-used Sendmail program."
pkg_upstream_url="http://www.postfix.org/"
pkg_license=('IPL-1.0')
pkg_source="http://postfix.mirrors.ovh.net/postfix-release/official/postfix-${pkg_version}.tar.gz"
pkg_shasum="4254c2ba499da7e1f7d4bb9c3de41419760d2dcde39b9101ab122c6226b636d7"
pkg_build_deps=(
  core/make
  core/gcc
  core/sed
  core/gawk
  core/m4
)
pkg_deps=(
  core/coreutils
  core/glibc
  core/libnsl
  core/mysql-client
  core/openssl
  core/zlib
)
pkg_bin_dirs=(bin sbin libexec)
pkg_lib_dirs=(lib)

pkg_svc_user="root"
pkg_svc_group="root"

do_build() {
  local mycc="-DNO_DB -DNO_NIS -DNO_PCRE"
  mycc="${mycc} -DHAS_MYSQL -I$(pkg_path_for "core/mysql-client")/include"
  mycc="${mycc} -DUSE_SASL_AUTH"
  mycc="${mycc} -DUSE_TLS -I$(pkg_path_for "core/openssl")/include"

  local myauxlibs="-L$(pkg_path_for "core/openssl")/lib -lssl -lcrypto -L$(pkg_path_for "core/glibc")/lib -lresolv"
  local myauxlibs_mysql="-L$(pkg_path_for "core/mysql-client")/lib -lmysqlclient -L$(pkg_path_for "core/zlib")/lib -lz -lm"

  make makefiles \
    shared=yes \
    dynamicmaps=yes \
    CCARGS="${mycc}" \
    AUXLIBS="${myauxlibs}" \
    AUXLIBS_MYSQL="${myauxlibs_mysql}"

  make -j$(nproc)
}

do_install() {
  # Fix post-install
  sed -i '/^PATH=/c\ ' postfix-install

  make non-interactive-package \
    install_root="${pkg_prefix}" \
    command_directory="/sbin" \
    config_directory="/config" \
    daemon_directory="/libexec" \
    data_directory="/data" \
    mail_spool_directory="/var/mail" \
    mailq_path="/bin/mailq" \
    manpage_directory="/man" \
    meta_directory="/meta" \
    newaliases_path="/bin/newaliases" \
    queue_directory="/var/spool" \
    sample_directory="/meta" \
    sendmail_path="/sbin/sendmail" \
    shlib_directory="/lib"

  # Cleanup configuration directory
  mv ${pkg_prefix}/config/*LICENSE ${pkg_prefix}

  for file in access aliases canonical generic header_checks relocated transport virtual *.default
  do
    rm ${pkg_prefix}/config/${file}
  done
}
