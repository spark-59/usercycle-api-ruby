# -*- encoding: utf-8 -*-
require File.expand_path('../lib/usercycle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Caleb Woods', 'Steve Odom', 'Ry Walker']
  gem.email         = ['team@usercycle.com']
  gem.summary       = %q{Ruby library for interating with the USERcycle API}
  gem.homepage      = 'https://github.com/usercycle/usercycle-api-ruby'
  gem.name          = "usercycle"
  gem.require_paths = ["lib"]
  gem.version       = Usercycle::VERSION
  
  gem.add_runtime_dependency "httparty", ">= 0.8.1"
end
