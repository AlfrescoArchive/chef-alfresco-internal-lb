# require 'spec_helper'

# describe 'alfresco-internal-lb::default' do
#   before do
#     stub_command('getenforce | grep -i enforcing').and_return(false)
#   end

#   let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

#   it 'includes the `haproxy` recipe' do
#     expect(chef_run).to include_recipe('alfresco-internal-lb::haproxy')
#   end

#   it 'does not include the `not` recipe' do
#     expect(chef_run).to_not include_recipe('alfresco-internal-lb::not')
#   end
# end
