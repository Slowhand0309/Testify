# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recot/version'

Gem::Specification.new do |spec|
  spec.name          = "recot"
  spec.version       = Recot::VERSION
  spec.authors       = ["slowhand0309"]
  spec.email         = ["slowhand0309@gmail.com"]
  spec.required_ruby_version = ">= 1.9.3"

  spec.summary       = 'Recot is a tool to gather evidence of the test'
  spec.description   = 'To generate a test result of documents in HTML format automatically'
  spec.homepage      = 'https://github.com/Slowhand0309/recot'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime Dependencies
  spec.add_runtime_dependency "gli", "~> 2.13"
  spec.add_runtime_dependency "guard", "~> 2.13"
  spec.add_runtime_dependency "guard-livereload", "~> 2.4"
  spec.add_runtime_dependency "rack", "~> 1.6"
  spec.add_runtime_dependency "rack-livereload", "~> 0.3"
  spec.add_runtime_dependency "listen", "~> 3.0"
  spec.add_runtime_dependency "activesupport", "~> 4.0"
  spec.add_runtime_dependency "wdm", ">= 0.1.0" if Gem.win_platform?

  # Development Dependencies
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
