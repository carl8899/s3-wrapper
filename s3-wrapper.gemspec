# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3-wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "s3-wrapper"
  spec.version       = S3Wrapper::VERSION
  spec.authors       = ["Carl Blomberg"]
  spec.email         = ["carlblomberg@gmail.com"]
  spec.summary       = %q{Upload files into AWS S3}
  spec.description   = %q{Upload files into AWS S3. It's designed to upload files under predefined hierachy.}
  spec.homepage      = "https://github.com/carl8899/s3-wrapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "aws-sdk", "~> 1.54"
end
