# Monit plan.sh for Habitat

This plan packages [monit](https://mmonit.com/monit), a monitoring agent with powers (it can restart processes on failure and so on).

## Usage

To use monit via habitat, you need to have `hab` installed, and then run `hab start rsertelon/monit`. This will fetch the latest stable version of this plan and run monit.

## Configuration

The [habitat configuration](https://bldr.habitat.sh/#/pkgs/rsertelon/monit/latest) (bottom of the page) is quite simple and self documented.

When using monit, you'll want to add your own rules, this can be done via `habitat's files`. Any file uploaded to your monit service group starting with `service-` will be included in monit's configuration (however, the service does not seem to restart on file upload).

To experienced monit users, you'll notice that there are some limitations in this configuration, some features are not configurable with this plan. If you find one missing, please, [file an issue](https://github.com/rsertelon/habitat-plans/issues.)