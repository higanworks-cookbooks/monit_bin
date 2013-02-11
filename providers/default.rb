action :enable do
  execute "monitensite #{new_resource.name}" do
    Chef::Log.info "/usr/local/sbin/monitensite #{new_resource.name}"
    command "#{node['monit']['bin_base']}/sbin/monitensite #{new_resource.name}"
    not_if do ::File.symlink?("#{node['monit']['dir']}/conf.enable/#{new_resource.name}") end
    new_resource.updated_by_last_action(true)
    notifies :reload, "service[monit]"
  end
end

action :disable do
  execute "monitdisite #{new_resource.name}" do
    command "#{node['monit']['bin_base']}/sbin/monitdisite #{new_resource.name}"
    only_if do ::File.symlink?("#{node['monit']['dir']}/conf.enable/#{new_resource.name}") end
    new_resource.updated_by_last_action(true)
    notifies :reload, "service[monit]"
  end
end

