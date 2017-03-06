ChefSpec.define_matcher :create_certs
ChefSpec.define_matcher :alfresco_haproxy_config

def run_create_certs(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:create_certs, :run, resource_name)
end

def run_alfresco_haproxy_config(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:alfresco_haproxy_config, :run, resource_name)
end
