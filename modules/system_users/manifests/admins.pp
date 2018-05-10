class system_users::admins {
  group { 'staff':
    ensure => present,
  }

  if $facts['kernel'] == 'windows' {
    user { 'admin':
      group => 'staff'
    }
  } else {
    package { 'csh':
      ensure => latest,
    }

    user { 'admin':
      group   => 'staff',
      shell   => '/bin/csh',
      require => Package['csh'],
    }
  }
}
