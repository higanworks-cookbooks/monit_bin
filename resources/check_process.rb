actions :create, :remove
default_action :create

attribute :service_name, :name_attribute => true
attribute :type, :default => "none", :kind_of => String
attribute :pidfile, :default => "/var/run/#{:service_name}.pid", :kind_of => String
attribute :regex, :default => "", :kind_of => String
attribute :start_program, :default => "/usr/sbin/service start #{:service_name}", :kind_of => String
attribute :stop_program,  :default => "/usr/sbin/service stop #{:service_name}",  :kind_of => String
attribute :policies, :default => [], :kind_of => Array, :required => true

