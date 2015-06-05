#
# = Class: ca::trust::redhat
#
class ca::trust::redhat (
  $enable = $::ca::trust::enable,
) {
  if ( $enable ) {
    exec { 'enable_ca_trust':
      command     => '/usr/bin/update-ca-trust enable',
      onlyif      => '/usr/bin/update-ca-trust check 2>&1 | /bin/grep -iq \'status: DISABLED.\'',
      refreshonly => true,
      before      => Exec['update_ca_trust'],
    }
    exec { 'update_ca_trust':
      command     => '/usr/bin/update-ca-trust extract',
      refreshonly => true,
    }
  } else {
    exec { 'disable_ca_trust':
      command => '/usr/bin/update-ca-trust disable',
      onlyif  => '/usr/bin/update-ca-trust check 2>&1 | /bin/grep -q \'Status: ENABLED.\'',
    }
  }

}
