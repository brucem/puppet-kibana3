#
class kibana3::install(
  $install_dir = $kibana3::params::install_dir
){
  include kibana3::params

  require 'git'

  vcsrepo { $install_dir:
    ensure   => present,
    provider => git,
    source   => 'git://github.com/elasticsearch/kibana.git',
  }

}
