# -*- encoding: utf-8 -*-
require File.expand_path('../lib/carb/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeroen Bourgois"]
  gem.email         = ["jeroenbourgois@gmail.com"]
  gem.description   = %q{Boost the start of a Proximity BBDO Octaplus framework}
  gem.summary       = %q{Boost the start of a Proximity BBDO Octaplus framework}
  gem.homepage      = "https://github.com/proximitybbdo/carb"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "carb"
  gem.require_paths = ["lib"]
  gem.version       = Carb::VERSION
  
  gem.required_ruby_version = '>= 1.9'
  
  gem.add_dependency "clamp"
  gem.add_dependency "fileutils"

  gem.add_development_dependency "rspec"
end
