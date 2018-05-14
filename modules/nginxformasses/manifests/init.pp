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
    
    file { $docroot:
      owner   => 'www-data',
      group   => 'www-data',
      mode    => '0755',
      recurse => true,
      require => Package['nginx'],
    }
  
    file { "${docroot}/index.html":
      owner   => 'www-data',
      group   => 'www-data',
      mode    => '0755',
      source  => "puppet:///modules/${module_name}/index.html",
      require => File["${docroot}"],
    }
  } else {
    notify { 'Negative Nancy': }
    include chocolatey

    package { 'powershell':
      provider => 'chocolatey',
      notify   => Reboot['Reboot-PowerShell'],
    }
    
    reboot { 'Reboot-PowerShell':
      apply => finished,
    }      
  } 
}
