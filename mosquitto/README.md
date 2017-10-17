# Mosquitto plan.sh for Habitat

This plan packages [mosquitto](https://mosquitto.org), a MQTT v3 broker.

## Usage

To use mosquitto via habitat, you need to have `hab` installed, and then run `hab start rsertelon/mosquitto`. This will fetch the latest stable version of this plan and run mosquitto.

## Configuration

The [habitat configuration](https://bldr.habitat.sh/#/pkgs/rsertelon/mosquitto/latest) (bottom of the page) follows [monit sample config file](https://github.com/eclipse/mosquitto/blob/master/mosquitto.conf).

For client authentication (using habitat's files):

* If you want to use a password file, use a file named `pwfile`
* If you want to use a PSK file, use a file named `pskfile`
* If you want to use a ACL file, use a file named `aclfile`

> Note that this might change in future versions of this package, and might be configurable in your TOML file.

This package __DOES NOT__ currently support:

* TLS
* Extra listeners
* websockets
* auth plugins