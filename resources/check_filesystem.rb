actions :create, :remove
default_action :create

attribute :service_name, :name_attribute => true
attribute :path, :kind_of => String , :required => true
attribute :policies, :default => [], :kind_of => Array, :required => true
