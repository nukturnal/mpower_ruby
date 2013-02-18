# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpower/version'

Gem::Specification.new do |gem|
  gem.name          = "mpower"
  gem.version       = MPower::VERSION
  gem.author       = "Alfred Rowe"
  gem.email         = ["alfred@ncodedevlabs.com"]
  gem.description   = %q{Ruby library for integrating with the MPower Gateway}
  gem.summary       = %q{Ruby client bindings for the MPower API}
  gem.homepage      = "http://mpowerpayments.com/developers/docs/ruby.html"
  gem.post_install_message = "Thanks for installing MPower Payments Ruby client.\nYou may read full API docs at http://mpowerpayments.com/developers/docs/ruby.html"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('rest-client', '~> 1.4')
  gem.add_dependency('multi_json', '~> 1.6.1')
  gem.add_dependency('faraday','~> 0.8.5')
  gem.add_dependency('faraday_middleware','~> 0.9.0')
  gem.add_development_dependency('rake', '~> 10.0.2')
end
