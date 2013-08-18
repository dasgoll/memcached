# encoding: utf-8

require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
  end
  c.path = "/sbin:/user/sbin"
end

describe package('memcached') do
  it { should be_installed }

end

describe service('memcached') do
  it { should be_enabled }
end

describe service('memcached') do
  it { should be_running }
end

describe port(11211) do
  it { should be_listening }
end
