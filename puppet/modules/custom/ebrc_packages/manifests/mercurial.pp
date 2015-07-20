
# install ["mercurial"]
class ebrc_packages::mercurial {
  
  $packages = ['mercurial']

  package { $packages :
    ensure => installed,
  }

}