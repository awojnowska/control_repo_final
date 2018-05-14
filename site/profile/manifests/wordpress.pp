#
class profile::wordpress{

class { 'apache':
 ensure  => 'latest',
}


}
