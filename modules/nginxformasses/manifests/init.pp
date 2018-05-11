class nginxforthemasses (
  String $docroot = "/var/www",
) {

  if $facts['kernel'] =~ /[Ll]inux/ {
    package { 'nginx':
      ensure => latest,
    }
  } else {
    notify { 'Negative Nancy': }
  } 


}
