
#include profiles::ebrc_wdk_host
include profiles::gus_wdk_host

firewall { '100 allow http':
  chain  => 'INPUT',
  state  => ['NEW'],
  dport  => '80',
  proto  => 'tcp',
  action => 'accept',
}

firewall { '100 allow https':
  chain  => 'INPUT',
  state  => ['NEW'],
  dport  => '443',
  proto  => 'tcp',
  action => 'accept',
}

