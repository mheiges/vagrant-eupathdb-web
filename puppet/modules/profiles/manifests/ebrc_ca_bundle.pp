# install EuPathDB BRC's Certificate Authority to filesystem and add to
# system CA bundle using ca-certificates utilities.
class profiles::ebrc_ca_bundle {

  $ca_name = hiera('ebrc_ca::cacert')

  ca::trust::add { $ca_name:
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
