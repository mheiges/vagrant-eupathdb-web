# Install one or more tomcat's from EuPathDB's YUM repo.
# Requires puppetlabs/tomcat module.
# Hiera
#   - ebrc_tomcat::packages - array of tomcat RPM packages to install
class profiles::ebrc_tomcat {

  include ::ebrc_yum_repo

  $packages = hiera('ebrc_tomcat::packages')

  class { 'tomcat':
    install_from_source => false,
  }

  profiles::ebrc_tomcat_instance { $packages: 
    require => Class['::ebrc_yum_repo']
  } 
  
  # -> Class['::tomcat']

}


