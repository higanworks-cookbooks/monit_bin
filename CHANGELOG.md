# Changelog

## v0.3.5

- [Tune] Change default attribute system_check system_localperf to system_node[:fqdn]

## v0.3.4

- [Tune] Change default attribute http_address 0.0.0.0 to node[:ipaddress] HT: @iuliancostan

## v0.3.3

- [Tune] Swap usage alert smartos.

## v0.3.2

- [Bugfix] binpath to use attribute.
- [Bugfix] process type matching does not work due typo.
- [Tune] Default monitorinig process for smartos. 

## v0.3.1

- [Bugfix] monitrc include_dir does not use attribute.

## v0.3.0

- Support Smartos
- add test-kitchin for ubuntu

## v0.2.1

- BUGFIX: resource[check_process] attrebuts default values are wrong.

## v0.2.0

- add Resources[check_system, check_filesystem, check_process]


## v0.1.0

- install monit from source
- control scripts and resource
