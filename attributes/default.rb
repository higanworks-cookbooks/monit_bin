default['monit']['version'] = "5.6"

case node['kernel']['machine']
  when "x86_64" then
    default['monit']['arc'] = "x64"
  when "i686" then
    default['monit']['arc'] = "x86"
end

default['monit']['binaries'] = "monit-#{node['monit']['version']}-#{node['os']}-#{node['monit']['arc']}"


default['monit']['dir'] = '/etc/monit'
default['monit']['bin_base'] = '/usr/local'

default['monit']['monitrc']['daemon'] = 60
default['monit']['monitrc']['init']   = true
default['monit']['monitrc']['logfile']   = "syslog facility log_daemon"
default['monit']['monitrc']['eventqueue']   = "basedir /var/monit/ slots 1000"


default['monit']['monitrc']['http_port']   = "2812"
default['monit']['monitrc']['http_address']   = node['ipaddress']
default['monit']['monitrc']['allows']   = ["localhost"]


default['monit']['monitrc']['mailserver']   = "localhost"
default['monit']['monitrc']['alerts']   = []


default['monit']['monitrc']['mmonit']   = nil # set mmonit http://user:pass@example.com:8080/collector

if node['platform'] == "smartos" then
  default['monit']['binaries'] = "monit-#{node['monit']['version']}-solaris-x64"
  default['monit']['dir'] = '/opt/local/etc/monit'
  default['monit']['bin_base'] = '/opt/local'
end

