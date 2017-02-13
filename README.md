# chef-alfresco-internal-lb cookbook

[![Build Status](https://travis-ci.org/Alfresco/chef-alfresco-internal-lb.svg)](https://travis-ci.org/Alfresco/chef-alfresco-internal-lb)
[![Cookbook](http://img.shields.io/cookbook/v/alfresco-internal-lb.svg)](https://github.com/Alfresco/chef-alfresco-internal-lb)
[![Coverage Status](https://coveralls.io/repos/github/Alfresco/chef-alfresco-internal-lb/badge.svg)](https://coveralls.io/github/Alfresco/chef-alfresco-internal-lb)

This cookbook will install the Internal Load Balancer part of the Alfresco stack.
The default choice is Haproxy, but it can be expanded to use your own engine.

## Attributes


| Key | Type | Description | Default |
|-----|------|-------------|---------|
| default['internal_lb']['engine'] | String | Engine of choice  | haproxy  |
| default['internal_lb']['log_level'] | String  |  lb log level |  info |
| default['internal_lb']['enable_ssl_header'] | Boolean  |  Add STS headers to the headers |  false |
| default['internal_lb']['hostname']  | String  | lb hostname  |  127.0.0.1 |
| default['internal_lb']['port']  | String  | lb port  |  9000 |
| default['internal_lb']['secure_port']  | String  | secure port  |  9001 |
| default['internal_lb']['rsyslog_bind'] | String | Bind haproxy to rsyslog  | true |
| default['internal_lb']['certs']['ssl_folder'] | String  |  Location of the SSL certificates |  /etc/pki/tls/certs |
| default['internal_lb']['certs']['filename'] | String  | common filename of the certificates | alfresco |
| default['internal_lb']['certs']['databag_name']  | String  | Databag name from where to retrieve the certificate | '' |
| default['internal_lb']['certs']['databag_item']  | String  | Databag item from where to retrieve the certificate  | '' |
| default['internal_lb']'certs']['skip_certificate_creation']| Boolean | Skip certs creation. False if you don't use SSL by default (dev mode) | false  |
| default['internal_lb']['error_pages']['folder'] | String  |  Where the error pages will be stored |  /var/www/html/errors |
| default['internal_lb']['components'] | Array  | Alfresco components to put under the LB | ['repo', 'share', 'solr'] |
| default['internal_lb']['share_port'] | Integer  | Alfresco Share Component Port | 8081 |
| default['internal_lb']['solr_port'] | Integer  | Alfresco SOLR Component Port | 8090 |
| default['internal_lb']['activiti_port'] | Integer  | Alfresco Activiti Component Port | 8060 |
| default['internal_lb']['alfresco_port'] | Integer  | Alfresco Alfresco Component Port | 8070 |
| default['internal_lb']['ec2']['enable_ec2_discovery'] | Boolean  | (EC2 only) [Use haproxy discovery system](https://github.com/Alfresco/chef-commons/blob/master/recipes/ec2-discovery.rb) | false |
| default['internal_lb']['ec2']['install_haproxy_discovery'] | Boolean  | (EC2 only) Enable discovery of other nodes in the same AZ | false |
| default['internal_lb']['logging_json_enabled'] | Boolean  | Enable JSON Logging | false |
## Usage

Just add the reference of this cookbook inside your `metadata.rb` file:

```
depends 'alfresco-internal-lb', '~> v0.3.2'
```


The cookbook is divided in 2 recipes:

- `alfresco-internal-lb::default` will install and upgrade the internal-lb of your choice ( specified under the `default['internal-lb']['engine']` attribute)

Include `alfresco-internal-lb` in your node `run_list`:

```json
{
  "run_list": [
    "recipe[alfresco-internal-lb::default]"
  ]
}
```

## License and Authors

Author: Enzo Rivello (<enzo.rivello@alfresco.com>)

Copyright 2017, Alfresco

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
