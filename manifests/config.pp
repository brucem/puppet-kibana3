#
class kibana3::config(
  $es_external_port = $kibana3::params::elasticsearch_external_port
){
  file{ "${kibana3::params::install_dir}/config.js":
    ensure  => file,
    content => template("${module_name}/config.js.erb"),
  }
}
