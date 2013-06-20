action :create do
  template "#{node['monit']['dir']}/conf.avail/#{new_resource.name}" do
    source "check_process.erb"
    cookbook "monit_bin"
     variables ({
       :service_name => new_resource.name,
       :type => new_resource.type,
       :pidfile => new_resource.pidfile,
       :regex => new_resource.regex,
       :start_program => new_resource.start_program,
       :start_timeout => new_resource.start_timeout,
       :stop_program => new_resource.stop_program,
       :stop_timeout => new_resource.stop_timeout,
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


