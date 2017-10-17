pkg_name=mosquitto
pkg_origin=rsertelon
pkg_version="1.4.14"
pkg_upstream_url="https://mosquitto.org"
pkg_description="An Open Source MQTT v3.1/v3.1.1 Broker"
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('EPL-1.0' 'EDL-1.0')
pkg_source="http://mosquitto.org/files/source/mosquitto-${pkg_version}.tar.gz"
pkg_shasum="156b1fa731d12baad4b8b22f7b6a8af50ba881fc711b81e9919ec103cf2942d1"
pkg_deps=(core/glibc core/openssl nandub/c-ares core/util-linux)
pkg_build_deps=(core/make core/gcc)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

do_build() {
    make
}

do_install() {
    sources=$HAB_CACHE_SRC_PATH/${pkg_dirname}

    ## server binaries
    cp $sources/src/mosquitto ${pkg_prefix}/bin/
    cp $sources/src/mosquitto_passwd ${pkg_prefix}/bin/

    ## client binaries
    cp $sources/client/mosquitto_pub ${pkg_prefix}/bin/
    cp $sources/client/mosquitto_sub ${pkg_prefix}/bin/

    ## libraries
    mkdir -p ${pkg_prefix}/lib
    cp $sources/lib/libmosquitto.so.1 ${pkg_prefix}/lib/
    cp $sources/lib/cpp/libmosquittopp.so.1 ${pkg_prefix}/lib/
    pushd ${pkg_prefix}/lib
      ln -s libmosquitto.so.1 libmosquitto.so
      ln -s libmosquittopp.so.1 libmosquittopp.so
    popd
}