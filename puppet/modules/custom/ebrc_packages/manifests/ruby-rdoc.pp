
# install ["ruby-rdoc"]
class ebrc_packages::ruby-rdoc {
  
  $packages = ['ruby-rdoc']

  package { $packages :
    ensure => installed,
  }

}