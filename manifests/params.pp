#
class kibana3::params {
  $install_dir                 = '/usr/share/kibana3'
  $elasticsearch_url           = 'http://127.0.0.1:9200'
  $elasticsearch_external_port = 80
  $webserver                   = 'nginx'
}
