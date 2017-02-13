alfresco_haproxy_config 'haproxy-config' do
  error_folder node['internal_lb']['error_pages']['folder']
  alfresco_components node['internal_lb']['components']
  backend_roles node['haproxy']['backends']['roles']
  jvm_route node['internal_lb']['hostname']
  enable_ec2_discovery node['internal_lb']['enable_ec2_discovery']

  action :run
end
