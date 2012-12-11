include_recipe "monit_bin::include"

## check localsystem setting
monit_bin_check_system "system_#{node['monit']['check_system']['name']}" do
  policies node['monit']['check_system']['policies']
end

monit_bin "system_#{node['monit']['check_system']['name']}"


## check filesystem setting
node['monit']['filesystem']['targets'].each do |k, v|
  monit_bin_check_filesystem "filesystem_#{k}" do
    path v['path']
    policies v['policies']
  end

  monit_bin "filesystem_#{k}"
end
