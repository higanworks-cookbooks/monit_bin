# monit_bin cookbook
[![Build Status](https://secure.travis-ci.org/higanworks-cookbooks/monit_bin.png?branch=master)](https://travis-ci.org/higanworks-cookbooks/monit_bin)

* Install monit from source.
* Include setting tools monitensite, monitdisite.
* Add LWRP for created configs.

# Requirements

* make (build-essential)

# Platform

- ubuntu
- SmartOS

# Usage

`recipe[monit]` to default install.

### call from other recipe

<pre><code>include_recipe "monit_binaries"

----
  put config from template to /etc/monit/conf.avail/
----

# enable
monit_binaries "myapp.conf"

# disable
monit_binaries "myapp.conf" do
  enable false
end
</code></pre>


### monitensite monitdisite

These tools contorol monit setting like a2ensite,a2disite.

Put your confing to `/etc/monit/conf.avail/` and...

** To enable setting**

    monitensite postfix.conf  
    monit reload

** To disable setting**

    monitdisite postfix.conf
    monit reload


# Attributes

TODO: Write attributes...

# Resources and Providers

### monit_bin

Call monitensite and monit disite.

**Example**
<pre><code>monit_bin "postfix" do
  action :enable
end</code></pre>

### monti_bin_check_system

build config for system resource with poricy strings.

**Example**
<pre><code>monit_bin_check_system "localperf" do
  action :create
  policies ["if memory usage > 70 % then alert"]
end</code></pre>


### monti_bin_check_filesystem

build config for filesystem resource with poricy strings.

**Example**
<pre><code>monit_bin_check_filesystem "rootfs" do
  action :create
  path "/"
  policies ["if space usage > 70 % then alert"]
end</code></pre>

### monti_bin_check_process

build config for process resource with poricy strings.

**Example**
<pre><code>monit_bin_check_process "sshd" do
  action :create
  type "pid"
  pidfile "/var/run/sshd.pid "
  start_program "/usr/sbin/service ssh start"
  stop_program "/usr/sbin/service ssh stop"
end</code></pre>


# Recipes

* default: install monit from souce.
* include: just define monit as service resource.
* services: monitoring services. setting from attributes.
* smartos_inittab: install and regist inittab for smartos. Smartos use this insted of default.

# Test

`kitchen test`

# Author

Author:: HiganWorks LLC (<sawanoboriyu@higanworks.com>)
