control '03-internal-lb' do
  impact 0.5
  title 'HA Proxy Configuration check for mentions'
  desc 'Ensures content related to solr,share and alfresco is checked on cfg'

  describe file('/etc/haproxy/haproxy.cfg') do
      its('content') { should include('backend solr') }
      its('content') { should include('backend share') }
      its('content') { should_not include('backend repo') }
      its('content') { should include('backend alfresco') }
      its('content') { should include('local_share_backend 127.0.0.1:8081') }
      its('content') { should include('local_solr_backend 127.0.0.1:8090') }
      its('content') { should include('local_alfresco_backend 127.0.0.1:8070') }
      its('content') { should include('url_param JSESSIONID') }
      its('content') { should include('check inter 5000') }
      it { should exist }
      it { should be_file }
    end
end


