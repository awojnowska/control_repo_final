class nginxformasses (
  String $docroot    = "/var/www",
  String $portnumber = "80",
) {

  if $facts['kernel'] =~ /[Ll]inux/ {
    package { 'nginx':
      ensure => latest,
    }

    file { '/etc/nginx/sites-available/default':
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template("${module_name}/default.erb"),
      require => Package['nginx'],
      notify  => Service['nginx'],
    }

    service { 'nginx':
      ensure  => running,
      require => Package['nginx'],
    }
  } else {
    notify { 'Negative Nancy': }
  } 


}
