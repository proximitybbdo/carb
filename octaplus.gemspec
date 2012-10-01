# -*- encoding: utf-8 -*-
require File.expand_path('../lib/octaplus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeroen Bourgois"]
  gem.email         = ["jeroenbourgois@gmail.com"]
  gem.description   = %q{Boost the start of a Proximity BBDO Octaplus framework}
  gem.summary       = %q{Boost the start of a Proximity BBDO Octaplus framework}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "octaplus"
  gem.require_paths = ["lib"]
  gem.version       = Octaplus::VERSION
end
