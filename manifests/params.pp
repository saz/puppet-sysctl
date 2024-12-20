class sysctl::params {

  # Keep the original symlink if we purge, to avoid ping-pong with initscripts
  case "${facts['os']['family']}-${facts['os']['release']['major']}" {
    'RedHat-7','Debian-8': {
      $symlink99 = true
    }
    default: {
      $symlink99 = false
    }
  }

  case $facts['os']['family'] {
    'FreeBSD': {
      $sysctl_dir = false
    }
    default: {
      $sysctl_dir = true
      $sysctl_dir_path = '/etc/sysctl.d'
      $sysctl_dir_owner = 'root'
      $sysctl_dir_group = 'root'
      $sysctl_dir_mode = '0755'
    }
  }

}

