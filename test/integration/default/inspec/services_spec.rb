describe package('haproxy') do
  it { should be_installed }
end

control '01-internal-lb' do
  impact 0.7
  title 'Verify Haproxy service'
  desc 'Ensures Haproxy service is up and running'
  describe service('haproxy') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

describe port(9001) do
  it { should be_listening }
  its('processes') { should include(/haproxy/) }
end

control '02-internal-lb' do
  impact 0.5
  title 'HA Proxy Configuration Check'

  describe file('/etc/haproxy/haproxy.cfg') do
    it { should exist }
    it { should be_file }
  end
end
