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

package { '::mysql::server':
  ensure                  => present,
  root_password           => 'Bruckhaus12$$',
  remove_default_accounts => true,
}

service { '::mysql::server':
  ensure  => 'running',
  enable  => true,
  require => Package['::mysql::server'],
}

# package { 'wordpress':
#   wp_owner    => 'wordpress',
#   wp_group    => 'wordpress',
#   db_user     => 'wordpress',
#   db_password => 'hvyH(S%t(\"0\"16',
# }
}
