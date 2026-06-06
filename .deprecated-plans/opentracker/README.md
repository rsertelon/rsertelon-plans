# Opentracker plan.sh for Habitat

This plan packages [opentracker](https://erdgeist.org/arts/software/opentracker/), a bittorrent tracker.

## Usage

To use opentracker via habitat, you need to have `hab` installed, and then run `hab start rsertelon/opentracker`. This will fetch the latest stable version of this plan and run opentracker.

## Configuration

The [habitat configuration](https://bldr.habitat.sh/#/pkgs/rsertelon/opentracker/latest) (bottom of the page) follows [opentracker sample config file](https://erdgeist.org/gitweb/opentracker/tree/opentracker.conf.sample).

Most features of opentracker are activated compile time. To keep this build simple, there is no extra feature activated (which makes the configuration file a bit useless except for listen addresses). So these features are not included:

* IPv6 - this would be ipv6 only
* Gzip-ed full scrapes
* White/black listing
* Cluster mode
* Stats restriction
* IP from query string
* Experimental or deprecated features

