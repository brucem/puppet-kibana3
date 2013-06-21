#
class kibana3::webserver::nginx(
  $server_names     = ['localhost'],
  $install_dir      = $kibana3::params::install_dir,
  $es_external_port = $kibana3::params::elasticsearch_external_port,
  $es_url           = $kibana3::params::elasticsearch_url,

){

  nginx::resource::vhost {'default':
    ensure         => present,
    server_names   => $server_names,
    listen_port    => $es_external_port,
    www_root       => $install_dir,
    default_server => true,
  }

  nginx::resource::location{ 'kibana-root':
    ensure      => present,
    vhost       => 'default',
    location    => '/',
    www_root    => '/usr/share/kibana3',
    index_files => ['index.html', 'index.htm'],
  }

  nginx::resource::location{ 'kibana-aliases':
    ensure             => present,
    vhost              => 'default',
    location           => '^/_aliases$',
    match_type         => '~',
    proxy              => $es_url,
    proxy_read_timeout => 90,
  }

  nginx::resource::location{ 'kibana-search':
    ensure             => present,
    vhost              => 'default',
    location           => '^/.*/_search$',
    match_type         => '~',
    proxy              => $es_url,
    proxy_read_timeout => 90,
  }

  nginx::resource::location{ 'kibana-dashboard':
    ensure             => present,
    vhost              => 'default',
    location           => '^/kibana-int/dashboard/.*$',
    match_type         => '~',
    proxy              => $es_url,
    proxy_read_timeout => 90,
  }

  nginx::resource::location{ 'kibana-tmp':
    ensure             => present,
    vhost              => 'default',
    location           => '^/kibana-int/temp.*$',
    match_type         => '~',
    proxy              => $es_url,
    proxy_read_timeout => 90,
  }

}
