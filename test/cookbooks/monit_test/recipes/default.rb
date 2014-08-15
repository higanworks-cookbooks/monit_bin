#
# Cookbook Name:: monit_test
# Recipe:: default
#
# Copyright 2014, HiganWorks LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

bash 'monit_ensite_sshd' do
  action :nothing
  code <<-EOH
  monitensite sshd
  EOH
end


monit_bin_check_process "sshd" do
  action :create
  type "pid"
  pidfile "/var/run/sshd.pid "
  start_program "/usr/sbin/service ssh start"
  stop_program "/usr/sbin/service ssh stop"
  restart_program "/usr/sbin/service ssh restart"
  notifies :run, 'bash[monit_ensite_sshd]', :immediately
  notifies :reload, 'service[monit]'
end


