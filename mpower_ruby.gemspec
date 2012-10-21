# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpower/version'

Gem::Specification.new do |gem|
  gem.name          = "mpower_ruby"
  gem.version       = MPower::VERSION
  gem.authors       = ["Alfred Rowe"]
  gem.email         = ["alfred@ncodedevlabs.com"]
  gem.description   = %q{MPower Payments is a better payment experience. See http://mpowerpayments.com for details}
  gem.summary       = %q{Ruby client bindings for the MPower API}
  gem.homepage      = "https://github.com/nukturnal/mpower_ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('rest-client', '~> 1.4')
  gem.add_dependency('multi_json', '~> 1.1')
end
