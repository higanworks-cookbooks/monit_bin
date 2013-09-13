#
# Cookbook Name:: monit_bin
# Recipe:: smartos_inittab
#
# Copyright (C) 2012 HiganWorks LLC
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


# cookbook_file "/etc/init/monit.conf" do
#   source "monit_upstart"
#   notifies :restart, "service[monit]"
# end

include_recipe "monit_bin::include"


[node['monit']['dir'], "/var/monit" ].each do |w|
  directory node['monit']['dir'] do
    action :create
    owner "root"
    group "root"
    mode  "0700"
  end
end

%w{conf.enable conf.avail}.each do |w|
  directory ::File.join(node['monit']['dir'], w) do
    action :create
    owner "root"
    group "root"
    mode  "0700"
  end
end

template "/etc/monitrc" do
  source "monitrc.erb"
  mode  "0600"
  variables node['monit']['monitrc']
  notifies :reload, "service[monit]"
end

script "add inittab" do
  interpreter "bash"
  flags "-e"
  code <<-EOH
  cat <<EOL >>/etc/inittab
### added_by_chef_recipe_monit_bin
mo::respawn:/opt/local/sbin/monit -I -c /etc/monitrc
EOL
  EOH
  not_if "grep added_by_chef_recipe_monit_bin /etc/inittab -q"
  notifies :restart, "service[monit]"
end


script "install_from_source" do
  interpreter "bash"
  user "root"
  Chef::Log.info("Start: install monit-#{node['monit']['version']}")
  flags "-e"
  code <<-"EOH"
    mkdir -p #{Chef::Config[:file_cache_path]}/monit
    cd #{Chef::Config[:file_cache_path]}/monit
    wget http://mmonit.com/monit/dist/binary/#{node['monit']['version']}/#{node['monit']['binaries']}.tar.gz
    tar xvzf #{node["monit"]['binaries']}.tar.gz
    cp -f monit-#{node['monit']['version']}/bin/monit /opt/local/sbin/
    cp -f monit-#{node['monit']['version']}/man/man1/monit.1 /opt/local/man/man1
  EOH

  only_if "test ! -f #{Chef::Config[:file_cache_path]}/monit/#{node['monit']['binaries']}.tar.gz"
  Chef::Log.info("End: install monit-#{node['monit']['version']}")
  notifies :restart, "service[monit]"
end


# monit setting controler

%w(monitensite monitdisite).each do |command|
  template "#{node['monit']['bin_base']}/sbin/#{command}" do
    source "#{command}.erb"
    mode 0744
    owner "root"
    group "root"
  end
end

