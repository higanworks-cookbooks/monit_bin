default['monit']['check_system']['name'] = node['fqdn'] || "localperf"
default['monit']['check_system']['policies'] = [
  "if loadavg(1min) > 15 for 5 cycles then alert",
  "if loadavg(5min) > 10 for 5 cycles then alert",
  "if memory usage > 90% for 5 cycles then alert",
  "if swap usage > 10% for 3 cycles then alert",
  "if cpu usage (wait) > 50% for 3 cycles then alert"
]


if node['platform'] == "smartos" then
  default['monit']['check_system']['policies'] = [
    "if loadavg(1min) > 15 for 5 cycles then alert",
    "if loadavg(5min) > 10 for 5 cycles then alert",
    "if swap usage > 85% for 3 cycles then alert",
    "if cpu usage (wait) > 50% for 3 cycles then alert"
  ]
end
