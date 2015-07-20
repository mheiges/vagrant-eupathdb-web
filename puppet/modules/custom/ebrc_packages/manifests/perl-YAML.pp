
# install ["perl-YAML"]
class ebrc_packages::perl-YAML {
  
  $packages = ['perl-YAML']

  package { $packages :
    ensure => installed,
  }

}