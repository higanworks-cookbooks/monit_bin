actions :create, :remove
default_action :create

attribute :service_name, :name_attribute => true
attribute :policies, :default => [], :kind_of => Array, :required => true
