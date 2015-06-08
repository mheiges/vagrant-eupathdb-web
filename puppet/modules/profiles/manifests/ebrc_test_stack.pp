# just for testing various code factorings for conflicts with other modules
class profiles::ebrc_test_stack {

  include ::ebrc_yum_repo
  include ::profiles::ebrc_ca_bundle

  Class['::ebrc_yum_repo'] ->
  Class['::profiles::ebrc_ca_bundle']

}