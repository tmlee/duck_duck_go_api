# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'duck_duck_go_api/version'

Gem::Specification.new do |spec|
  spec.name          = "duck_duck_go_api"
  spec.version       = DuckDuckGoApi::VERSION
  spec.authors       = ["TM Lee"]
  spec.email         = ["tm89lee@gmail.com"]
  spec.description   = %q{Duck Duck Go API for Ruby}
  spec.summary       = %q{Lightweight, flexible library for the Duck Duck Go API in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('faraday', '~> 0.8')
  spec.add_dependency('json', '~> 1.8.2')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency("fakeweb", "~> 1.3.0")
end
