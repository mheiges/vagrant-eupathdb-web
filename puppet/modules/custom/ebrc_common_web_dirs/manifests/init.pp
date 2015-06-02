# == Class: ebrc_common_web_dirs
#
# Common directories shared by HTTPD and Tomcat applications
# and shared across projects.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# [*ebrc_common_web_dirs::parent_dir*]
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the function of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
#
#
# === Examples
#
#  class { 'ebrc_common_web_dirs':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class ebrc_common_web_dirs {

  $parent_dir = hiera('ebrc_common_web_dirs::parent_dir')

  file {$parent_dir:
    ensure => directory,
    purge  => false,
    mode   => '0755',
    owner  => root,
    group  => root,
  }

  file {'/var/www/Common/tmp':
    ensure  => directory,
    purge   => false,
    mode    => '0755',
    owner   => root,
    group   => root,
    require => File['/var/www/Common'],
  }

  file {[
          '/var/www/Common/tmp/blast',
          '/var/www/Common/tmp/gbrowseLogs',
          '/var/www/Common/tmp/highSpeedSnpSearch',
          '/var/www/Common/tmp/highSpeedChipSnpSearch',
          '/var/www/Common/tmp/wdkStepAnalysisJobs',
    ]:
    ensure  => directory,
    purge   => false,
    mode    => '1777',
    owner   => root,
    group   => root,
    require => File['/var/www/Common/tmp'],
  }

  file {'/var/www/Common/communityFilesMirror':
    ensure  => directory,
    purge   => false,
    mode    => '1777',
    owner   => root,
    group   => root,
    require => File['/var/www/Common'],
  }

}
