require 'spec_helper'

describe 'alfresco-internal-lb::haproxy-config' do
  before do
    stub_command('getenforce | grep -i enforcing').and_return(false)
  end

  let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }
  it 'runs a haproxy-config with attributes' do
    expect(chef_run).to run_alfresco_haproxy_config('haproxy-config').with(
      error_folder: '/var/www/html/errors',
      alfresco_components: %w(repo share solr),
      # backend_roles: node['haproxy']['backends']['roles'],
      jvm_route: '127.0.0.1',
      enable_ec2_discovery: false
    )
  end
end
