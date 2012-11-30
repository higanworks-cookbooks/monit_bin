# monit_bin cookbook

* Install monit from source.
* Include setting tools monitensite, monitdisite.
* Add LWRP for created configs.

# Requirements

* make (build-essential)

# Usage

`recipe[monit]` to default install.

### call from other recipe

<pre><code>include_recipe "monit_binaries"

----
  put config from template to /etc/monit/conf.avail/
----

# enable
monit_binaries "myapp.conf"

# disable
monit_binaries "myapp.conf" do
  enable false
end
</code></pre>


### monitensite monitdisite

These tools contorol monit setting like a2ensite,a2disite.

Put your confing to `/etc/monit/conf.avail/` and...

** To enable setting**

    monitensite postfix.conf  
    monit reload

** To disable setting**

    monitdisite postfix.conf
    monit reload


# Attributes

TODO: Write attributes...

# Recipes

* default

# Author

Author:: HiganWorks LLC (<sawanoboriyu@higanworks.com>)
