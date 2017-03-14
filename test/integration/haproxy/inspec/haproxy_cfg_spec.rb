control '03-internal-lb' do
	impact 0.5
	title 'HA Proxy Configuration check for mentions'
	desc 'Ensures that solr,share and repo is mentioned in the file'

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
  	end


	describe port(9000) do
  		it { should be_listening }
  		its('processes') { should include(/haproxy/) }
	end

	describe port(9001) do
  		it { should be_listening }
  		its('processes') { should include(/haproxy/) }
	end

	describe port(1936) do
  		it { should be_listening }
  		its('processes') { should include(/haproxy/) }
	end

	describe user('haproxy') do
      it { should exist }
    end

	describe group('haproxy') do
      it { should exist }
    end




end
