#
class kibana3::webserver(
  $server_names     = ['localhost'],
  $install_dir      = $kibana3::params::install_dir,
  $es_external_port = $kibana3::params::elasticsearch_external_port,
  $es_url           = $kibana3::params::elasticsearch_url,
  $type             = $kibana3::params::webserver,
){
  class{"kibana3::webserver::${type}":
    server_names     => $server_names,
    install_dir      => $install_dir,
    es_external_port => $es_external_port,
    es_url           => $es_url,
  }
}
