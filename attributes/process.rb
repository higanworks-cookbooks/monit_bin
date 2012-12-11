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

