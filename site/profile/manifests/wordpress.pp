#
class profile::wordpress{

include '::mysql::server'

package { 'apache2':
  ensure  => present,
}

service { 'apache2':
  ensure   => 'running',
  enable   => 'true',
  require  => Package['apache2'],
}

package { 'mysql':
  ensure => present,
}

service {'mysql':
  ensure  => 'running',
  enable  => true,
  require => Package['mysql'],
}

# package { 'wordpress':
#   wp_owner    => 'wordpress',
#   wp_group    => 'wordpress',
#   db_user     => 'wordpress',
#   db_password => 'hvyH(S%t(\"0\"16',
# }
}
