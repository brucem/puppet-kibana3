class kibana3::install {
  require 'git'

  vcsrepo { '/usr/share/kibana3':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/elasticsearch/kibana.git',
  }

  nginx::resource::vhost {'default':
    ensure         => present,
    server_names   => ['33.33.33.20'],
    listen_port    => 80,
    www_root       => '/usr/share/kibana3',
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
    proxy              => 'http://127.0.0.1:9200',
    proxy_read_timeout => 90,
  }

  nginx::resource::location{ 'kibana-search':
    ensure             => present,
    vhost              => 'default',
    location           => '^/.*/_search$',
    match_type         => '~',
    proxy              => 'http://127.0.0.1:9200',
    proxy_read_timeout => 90,
  }

  nginx::resource::location{ 'kibana-dashboard':
    ensure             => present,
    vhost              => 'default',
    location           => '^/kibana-int/dashboard/.*$',
    match_type         => '~',
    proxy              => 'http://127.0.0.1:9200',
    proxy_read_timeout => 90,
  }

  nginx::resource::location{ 'kibana-tmp':
    ensure             => present,
    vhost              => 'default',
    location           => '^/kibana-int/temp.*$',
    match_type         => '~',
    proxy              => 'http://127.0.0.1:9200',
    proxy_read_timeout => 90,
  }

}
