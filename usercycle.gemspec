# -*- encoding: utf-8 -*-
require File.expand_path('../lib/usercycle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_development_dependency 'rspec', '~> 2.11'
  gem.add_development_dependency 'rspec-given', '~> 1.4.0'
  gem.add_development_dependency 'webmock', '~> 1.6'

  gem.authors       = ['Caleb Woods', 'Steve Odom', 'Ry Walker', 'Lukas Fittl']
  gem.email         = ['team@spark59.com']
  gem.summary       = 'Ruby library for integrating with the USERcycle API'
  gem.homepage      = 'https://github.com/usercycle/usercycle-api-ruby'
  gem.name          = 'usercycle'
  gem.require_paths = ['lib']
  gem.version       = Usercycle::VERSION
  
  gem.add_runtime_dependency 'httparty', '>= 0.8.1'
end
