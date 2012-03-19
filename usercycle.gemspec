# -*- encoding: utf-8 -*-
require File.expand_path('../lib/usercycle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Caleb Woods"]
  gem.email         = ["calebawoods@gmail.com"]
  gem.description   = %q{Ruby Libray for interating with the USERCycle API}
  gem.summary       = %q{Library based of original rails plugin https://github.com/usercycle/usercycle-ruby-api}
  gem.homepage      = ""

  gem.executables   = 'git ls-files -- bin/*'.split("\n").map{ |f| File.basename(f) }
  gem.files         = 'git ls-files'.split("\n")
  gem.test_files    = 'git ls-files -- {test,spec,features}/*'.split("\n")
  gem.name          = "usercycle"
  gem.require_paths = ["lib"]
  gem.version       = Usercycle::VERSION
  
  gem.add_runtime_dependency "httparty", ">= 0.8.1"
end
