# == Class: ebrc_yum_repo
#
# Full description of class ebrc_yum_repo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
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
# === Examples
#
#  class { 'ebrc_yum_repo':
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
class ebrc_yum_repo {

  yumrepo { 'eupathdb':
    descr    => "EuPathDB Packages for RHEL/CentOS ${::operatingsystemmajrelease} - ${::architecture}",
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EUPATHDB',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EUPATHDB'],
    baseurl  => "http://pulp.uga.apidb.org/pulp/repos/eupathdb/${::operatingsystemmajrelease}/${::architecture}",
    priority => 1,
    enabled  => 1,
    gpgcheck => 1,
  }

  yumrepo { 'eupathdb-fasttrack':
    descr    => "EuPathDB Fasttrack Packages for RHEL/CentOS ${::operatingsystemmajrelease} - ${::architecture}",
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EUPATHDB',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EUPATHDB'],
    baseurl  => "http://pulp.uga.apidb.org/pulp/repos/eupathdb/${::operatingsystemmajrelease}/fasttrack/${::architecture}",
    priority => 1,
    enabled  => 1,
    gpgcheck => 0,
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EUPATHDB':
    owner  => root,
    group  => root,
    mode   => '0644',
    source =>  'puppet:///modules/ebrc_yum_repo/RPM-GPG-KEY-EUPATHDB',
  }

}
