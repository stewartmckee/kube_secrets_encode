# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kube_secrets_encode/version"

Gem::Specification.new do |spec|
  spec.name          = "kube_secrets_encode"
  spec.version       = KubeSecretsEncode::VERSION
  spec.authors       = ["Stewart McKee"]
  spec.email         = ["stewart@theizone.co.uk"]

  spec.summary       = "Simple tool for encoding and decoding kubernetes secrets"
  spec.description   = "Simple tool for encoding and decoding kubernetes secrets"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   << "kube_secrets"
  spec.require_paths = ["lib"]

  spec.add_dependency "executable"
  spec.add_dependency "awesome_print"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
