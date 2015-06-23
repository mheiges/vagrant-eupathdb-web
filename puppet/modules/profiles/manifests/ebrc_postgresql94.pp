
class profiles::ebrc_postgresql94 {

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.4'
  }
  contain postgresql::globals

  contain 'postgresql::lib::java'

  Class['postgresql::globals'] -> Class['postgresql::lib::java']

}