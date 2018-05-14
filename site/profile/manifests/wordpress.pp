#
class profile::wordpress{

package { 'apache':
  ensure  => installed,
}
package { 'nginx':
 ensure  => 'absent',
}


}
