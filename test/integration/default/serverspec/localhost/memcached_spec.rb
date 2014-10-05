if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

require 'spec_helper'

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
