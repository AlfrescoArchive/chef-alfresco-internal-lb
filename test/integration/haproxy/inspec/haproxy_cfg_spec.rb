control '03-internal-lb' do
  impact 0.7
  title 'HA Proxy Configuration Check'

  describe file('/etc/haproxy/haproxy.cfg') do
    its('content') { should include('backend alfresco') }
  end
end
