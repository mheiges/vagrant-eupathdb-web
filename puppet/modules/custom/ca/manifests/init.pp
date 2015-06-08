# Unimplemented placeholder for init class. Use the ca::trust::add definition 
# in practice.
#
#     ca::trust::add { $ca_name:
#       source => "puppet:///modules/apidb_ca/${ca_name}",
#     }
#
# A class implementation would only allow a single CA management, so not would
# be very useful.
class ca {
  fail ( "Class['ca'] is not implemented. Use the ca::trust::add definition" )
}