class system_users::admins {

  group { 'staff':
    ensure => present,
  }

  user { 'admin':
    group => 'staff',
    shell => '/bin/csh',
  }

}
