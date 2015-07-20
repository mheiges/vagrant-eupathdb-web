
# install ["openldap-clients"]
class ebrc_packages::openldap-clients {
  
  $packages = ['openldap-clients']

  package { $packages :
    ensure => installed,
  }

}