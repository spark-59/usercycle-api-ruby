require 'usercycle'
require 'rspec'
require 'rspec-given'
require 'webmock/rspec'

def stub_get(path)
  uri = "http://api.usercycle.com/api/v1/#{path}"
  stub_request(:get, uri)
end

