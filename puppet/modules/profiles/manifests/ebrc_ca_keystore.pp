# install EuPathDB BRC's Certificate Authority to java keystore.
# Leverages puppetlabs/java_ks
#
# Requirements
#   - EuPathDB's CA must already be on the file system 
#     (see profile::ebrc_ca_bundle).
#   - keytool command must be available (provided by modern Java packages)
class profiles::ebrc_ca_keystore {

  $alias = 'eupathdbinternalca'
  $cacert = hiera('ebrc_ca::cacert')
  $java_home = hiera('ebrc_java::java_home')
  $java_ks_target = hiera('java_keystore_target')
  $java_ks_passwd = hiera('java_keystore_passwd')

  if $::osfamily == 'redhat' {
    $certdir = '/etc/pki/tls/certs'
  } else {
    fail("profiles::ebrc_ca_keystore: Unsupported osfamily: ${::osfamily}")
  }

  java_ks { $alias:
    ensure       => latest,
    path         => ["${java_home}/bin", '/usr/bin'],
    certificate  => "${certdir}/${cacert}",
    target       => $java_ks_target,
    password     => $java_ks_passwd,
    trustcacerts => true,
  }


}