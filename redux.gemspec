# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/redux/version"

Gem::Specification.new do |gem|
  gem.name          = "redux"
  gem.version       = Redux::VERSION
  gem.summary       = "redux.rb"
  gem.description   = "Tiny Redux implementation in Ruby."
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["hi@ruby.consulting"]
  gem.homepage      = "https://github.com/janlelis/redux.rb"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.0", "< 4.0"
end
