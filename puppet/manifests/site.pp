
class { '::apache': }

class { '::ebrc_apache':
  require => Class['::apache']
}

exec { 'create-default-index':
  command => 'echo Hello World > /var/www/html/index.html',
  path    => '/bin',
  creates => '/var/www/html/index.html',
  require => Class['apache'],
}

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

