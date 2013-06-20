actions :create, :remove
default_action :create

attribute :service_name, :name_attribute => true
attribute :type, :default => "pid", :regex => /^(pid|matching)$/, :required => true
attribute :pidfile, :kind_of => String
attribute :regex, :default => "", :kind_of => String
attribute :start_program, :kind_of => String, :required => true
attribute :start_timeout, :kind_of => Fixnum, :required => false
attribute :stop_program,  :kind_of => String, :required => true
attribute :stop_timeout,  :kind_of => Fixnum, :required => false
attribute :policies, :default => [], :kind_of => Array
