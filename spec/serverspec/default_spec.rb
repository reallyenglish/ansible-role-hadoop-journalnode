require 'spec_helper'
require 'serverspec'

package = 'hadoop_journalnode'
service = 'hadoop_journalnode'
config  = '/etc/hadoop_journalnode/hadoop_journalnode.conf'
user    = 'hadoop_journalnode'
group   = 'hadoop_journalnode'
ports   = [ PORTS ]
log_dir = '/var/log/hadoop_journalnode'
db_dir  = '/var/lib/hadoop_journalnode'

case os[:family]
when 'freebsd'
  config = '/usr/local/etc/hadoop_journalnode.conf'
  db_dir = '/var/db/hadoop_journalnode'
end

describe package(package) do
  it { should be_installed }
end 

describe file(config) do
  it { should be_file }
  its(:content) { should match Regexp.escape('hadoop_journalnode') }
end

describe file(log_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

describe file(db_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

case os[:family]
when 'freebsd'
  describe file('/etc/rc.conf.d/hadoop_journalnode') do
    it { should be_file }
  end
end

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end

ports.each do |p|
  describe port(p) do
    it { should be_listening }
  end
end
