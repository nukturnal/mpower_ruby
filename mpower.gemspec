# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpower/version'

Gem::Specification.new do |gem|
  gem.name          = "mpower"
  gem.version       = MPower::VERSION
  gem.authors       = ["Alfred Rowe"]
  gem.email         = ["alfred@ncodedevlabs.com"]
  gem.description   = %q{Ruby library for integrating with the MPower Gateway}
  gem.summary       = %q{Ruby client bindings for the MPower API}
  gem.homepage      = "https://github.com/nukturnal/mpower_ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('rest-client', '~> 1.4')
  gem.add_dependency('multi_json', '~> 1.1')
  gem.add_dependency('faraday')
  gem.add_dependency('faraday_middleware')
end
