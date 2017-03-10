require 'rspec/core' unless defined? RSpec.configure
require 'spec_helper'

describe 'alfresco-internal-lb::haproxy' do
  context 'first' do
    before do
      stub_command('getenforce | grep -i enforcing').and_return(false)
    end

    let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }
    it 'Creation of haproxy certs' do
      expect(chef_run).to run_create_certs('Creation of haproxy certs').with(
        ssl_filename: 'alfresco',
        ssl_fqdn: '127.0.0.1',
        ssl_folder: '/etc/pki/tls/certs',
        ssl_databag: '',
        ssl_databag_item: '',
        skip_certificate_creation: true
      )
    end
    it 'includes the `commons::error-pages` recipe' do
      expect(chef_run).to include_recipe('commons::error-pages')
    end
    it 'includes the `haproxy::default` recipe' do
      expect(chef_run).to include_recipe('haproxy::default')
    end
    it 'includes the `alfresco-internal-lb::haproxy-config` recipe' do
      expect(chef_run).to include_recipe('alfresco-internal-lb::haproxy-config')
    end
    it 'creates a directory `/var/log/haproxy`' do
      expect(chef_run).to create_directory('/var/log/haproxy').with(
        owner: 'haproxy',
        group: 'haproxy'
      )
      expect(chef_run).to_not create_directory('/var/log/haproxy').with(
        owner: 'ha',
        group: 'proxy'
      )
    end
    it 'creates a template `/etc/rsyslog.d/haproxy.conf`' do
      expect(chef_run).to_not create_template('/etc/rsyslog.d/haproxy.conf').with(
        source: '/rsyslog/haproxy.conf.erb'
      )
    end
  end
  context 'selinux' do
    before do
      stub_command('getenforce | grep -i enforcing').and_return(true)
      stub_command('which semanage').and_return(true)
      stub_command('already_permissive').and_return(false)
      stub_command('semanage permissive -l | grep haproxy_t').and_return(false)
    end
    let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }
    selinux_commands = {}
    # selinux_commands["mkdir -p /var/www/html/errors ; semanage fcontext -a -t haproxy_var_run_t \"/var/www/html/errors(/.*)\?\" ; restorecon -Rv /var/www/html/errors;"]  = "ls -lZ /var/www/html/errors | grep haproxy_var_run_t"
    # selinux_commands["touch /var/run/haproxy.stat ; semanage fcontext -a -t haproxy_var_run_t \"/var/run/haproxy\\.stat.*\" ; restorecon -Rv /var/run/haproxy.stat;"] = "ls -lZ /var/run/haproxy.stat | grep haproxy_var_run_t"
    # selinux_commands["semanage port -m -t http_port_t -p tcp 9001"] = "semanage port -l | grep http_port_t | grep 9001"
    # selinux_commands["semanage port -m -t http_port_t -p tcp 1936"] = "semanage port -l | grep http_port_t | grep 1936"
    selinux_commands['semanage permissive -a haproxy_t'] = 'semanage permissive -l | grep haproxy_t'

    # TODO: make it a custom resource
    selinux_commands.each do |command, _already_permissive|
      it 'selinux' do
        expect(chef_run).to run_execute("selinux-command-#{command}")
      end
    end
  end
end
