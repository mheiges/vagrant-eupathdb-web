
# install ["R-pdInfoBuilder"]
class ebrc_packages::R-pdInfoBuilder {
  
  $packages = ['R-pdInfoBuilder']

  package { $packages :
    ensure => installed,
  }

}