Kibana3 module for Puppet
=========================

This is the Kibana3 module. It installs kibana3 from github and sets up a
suitable nginx configuration.

Basic usage
-----------
To install a system suitable for running Kibana3

    class { 'kibana3': }

Dependencies
------------
Functionality is dependant on the following modules:

- [nginx] (https://github.com/dhutty/puppet-nginx)
- [vcsrepo] (https://github.com/puppetlabs/puppetlabs-vcsrepo)
- [git] (https://github.com/puppetlabs/puppetlabs-git)

Copyright and License
---------------------

Copyright (C) 2013 [Bruce Morrison](http://www.stuffandcontent.com/)

Bruce Morrison can be contacted at: bruce@stuffansdcontent.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
