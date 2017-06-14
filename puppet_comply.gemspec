# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'puppet_comply/version'

Gem::Specification.new do |spec|
  spec.name          = "puppet_comply"
  spec.version       = PuppetComply::VERSION
  spec.authors       = ["Jesse Reynolds"]
  spec.email         = ["jesse@va.com.au"]

  spec.summary       = %q{compliance test puppet code}
  spec.homepage      = "https://github.com/jessereynolds/puppet_comply"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "escort", "0.4.0"
  spec.add_runtime_dependency "puppet_forge"
  spec.add_runtime_dependency "librarian-puppet"
end
