require 'spec_helper'
require 'serverspec'

package = 'hadoop2'
service = 'journalnode'
config  = '/etc/hadoop_journalnode/hadoop_journalnode.conf'
user    = 'hdfs'
group   = 'hadoop'
ports   = [ 8485, 8480 ]
log_dir = '/var/log/hadoop'
db_dir  = '/var/lib/journalnode'

case os[:family]
when 'freebsd'
  db_dir = '/var/db/journalnode'
end

describe package(package) do
  it { should be_installed }
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

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end

ports.each do |p|
  describe port(p) do
    it { should be_listening }
  end
end
