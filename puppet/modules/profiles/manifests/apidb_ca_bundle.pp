# install EuPathDB BRC's Certificate Authority to filesystem and add to
# system CA bundle using ca-certificates utilities.
class profiles::apidb_ca_bundle {

  $ca_name = 'apidb-ca-rsa.crt'

  class { 'ca':
    name   => 'apidb-ca-rsa.crt',
    source => "puppet:///modules/apidb_ca/${ca_name}",
  }

  file { "/etc/pki/tls/certs/${ca_name}":
    ensure => file,
    source => "puppet:///modules/apidb_ca/${ca_name}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}