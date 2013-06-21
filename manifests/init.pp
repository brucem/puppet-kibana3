# == Class: kibana3
#
# Full description of class kibana3 here.
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
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { kibana3:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class kibana3 (
  $install_dir      = $kibana3::params::install_dir,
  $es_external_port = $kibana3::params::elasticsearch_external_port,
  $es_url           = $kibana3::params::elasticsearch_url,
  $type             = $kibana3::params::webserver,
) inherits kibana3::params {

  class { 'kibana3::install':
    install_dir => $install_dir,
  }

  class { 'kibana3::config':
    es_external_port => $es_external_port,
  }

  class { 'kibana3::webserver':
    install_dir      => $install_dir,
    es_external_port => $es_external_port,
    es_url           => $es_url,
    type             => $type,
  }

  Class['kibana3::install']
  -> Class['kibana3::config']
  -> Class['kibana3::webserver']

}
