name             'alfresco-internal-lb'
maintainer       'Alfresco Tooling & Automation Team'
maintainer_email 'enzo.rivello@alfresco.com'
license          'Apache 2.0'
description      'Installs/Configures chef-alfresco-internal-lb'
long_description 'Installs/Configures the Alfresco internal load balancer, for self discovery'
version          '0.3.2'

issues_url       'https://github.com/Alfresco/chef-alfresco-internal-lb/issues'
source_url       'https://github.com/Alfresco/chef-alfresco-internal-lb'

supports 'centos', '>= 7.0'
supports 'redhat', '>= 7.0'

depends 'commons'
depends 'haproxy', '~> 1.6.6'
depends 'netstat', '~> 0.1.0'
