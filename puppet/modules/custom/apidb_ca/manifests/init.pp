# Manage EuPathDB's internal Certificate Authority

class apidb_ca {

  $eupathdb_cacert_dest = hiera('apidb_ca::cacert_dest')
  $java_ks_target = hiera('java_keystore_target')
  $java_ks_passwd = hiera('java_keystore_passwd')
  $java_home = hiera('ebrc_java::java_home')

  file { 'ca.crt':
    path   => $apidb_ca::eupathdb_cacert_dest,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/apidb_ca/apidb-ca-rsa.crt',
  }

  # Use RHEL's ca-certificates package to manage system ca-bundle.crt.
  # ca-certificates is not available on RHEL 5.
  if $::operatingsystemmajrelease >= 6 {
    ca::trust::add { 'update-ca-trust':
      source => 'puppet:///modules/apidb_ca/apidb-ca-rsa.crt',
    }
  }

  # https://forge.puppetlabs.com/puppetlabs/java_ks
  java_ks { 'puppetca:keystore':
    ensure       => latest,
    path         => ["${java_home}/bin", '/usr/bin'],
    certificate  => $eupathdb_cacert_dest,
    target       => $java_ks_target,
    password     => $java_ks_passwd,
    trustcacerts => true,
    require      => File[$apidb_ca::eupathdb_cacert_dest],
  }

}