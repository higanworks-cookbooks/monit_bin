action :create do
  template "#{node['monit']['dir']}/conf.avail/#{new_resource.name}" do
    source "check_filesystem.erb"
    cookbook "monit_bin"
     variables ({
       :service_name => new_resource.name,
       :path => new_resource.path,
       :policies => new_resource.policies
     })
    new_resource.updated_by_last_action(true)
  end
end


action :remove do
  monit_bin new_resource.name do
    action :disable
  end
  file "#{node['monit']['dir']}/conf.avail/#{new_resource.name}" do
    action :delete
    new_resource.updated_by_last_action(true)
  end
end

