
# install ["iperf3"]
class ebrc_packages::iperf3 {
  
  $packages = ['iperf3']

  package { $packages :
    ensure => installed,
  }

}