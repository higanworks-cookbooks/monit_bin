include_recipe "monit_bin::include"

## check localsystem setting
monit_bin_check_system node['monit']['check_system']['name'] do
  policies node['monit']['check_system']['policies']
end

monit_bin node['monit']['check_system']['name'] do
#  notifies :reload, "service[monit]"
end



