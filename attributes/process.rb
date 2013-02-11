default['monit']['process']['targets'] = {
  "cron" => {
    "type" => "pid",
    "pidfile" => "/var/run/crond.pid",
    "start_program" => "/usr/sbin/service cron start",
    "stop_program"  => "/usr/sbin/service cron stop",
    "policies" => [
      "if 2 restarts within 3 cycles then alert"
    ]
  },
  "sshd" => {
    "type" => "pid",
    "pidfile" => "/var/run/sshd.pid",
    "start_program" => "/usr/sbin/service ssh start",
    "stop_program"  => "/usr/sbin/service ssh stop",
    "policies" => [
      "if 2 restarts within 3 cycles then alert"
    ]
  },

}

if node['platform'] == "smartos" then
  default['monit']['process']['targets'] = {
    "cron" => {
      "type" => "matching",
      "regex" => "/usr/sbin/cron",
      "start_program" => "/usr/sbin/svcadm enable -s cron",
      "stop_program"  => "/usr/sbin/svcadm disable -s cron",
      "policies" => [
        "if 2 restarts within 3 cycles then alert"
      ]
    },
    "sshd" => {
      "type" => "pid",
      "pidfile" => "/var/run/sshd.pid",
      "start_program" => "/usr/sbin/svcadm enable -s ssh",
      "stop_program"  => "/usr/sbin/svcadm disable -s ssh",
      "policies" => [
        "if 2 restarts within 3 cycles then alert"
      ]
    },
  
  }
end

