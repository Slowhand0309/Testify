# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testify/version'

Gem::Specification.new do |spec|
  spec.name          = "testify"
  spec.version       = Testify::VERSION
  spec.authors       = ["slowhand0309"]
  spec.email         = ["slowhand0309@gmail.com"]

  spec.summary       = 'Testify is a tool to gather evidence of the test'
  spec.description   = 'To generate a test result of documents in HTML format automatically'
  spec.homepage      = 'https://github.com/Slowhand0309/testify'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime Dependencies
  spec.add_runtime_dependency "gli", "~> 2.13"
  spec.add_runtime_dependency "guard", "~> 2.13"
  spec.add_runtime_dependency "guard-livereload", "~> 2.4"
  spec.add_runtime_dependency "rack", "~> 1.6"
  spec.add_runtime_dependency "rack-livereload", "~> 0.3"
  spec.add_runtime_dependency "guard-rake", "~> 1.0"
  spec.add_runtime_dependency "activesupport", "~> 4.0"

  # Development Dependencies
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
