default['monit']['filesystem']['targets'] = {
  "rootfs" => {
    "path" => "/",
    "policies" => [
      "if changed fsflags then alert",
      "if space usage > 60 % then alert",
      "if inode usage > 60 % then alert"
    ]
  }
}
