# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chromarks/version'

Gem::Specification.new do |gem|
  gem.name          = 'chromarks'
  gem.version       = Chromarks::VERSION
  gem.authors       = ['Jesper Kjeldgaard']
  gem.email         = ['thejspr@gmail.com']
  gem.description   = %q{Search, list and open Chrome bookmarks in your terminal.}
  gem.summary       = %q{Search, list and open Chrome bookmarks in your terminal.}
  gem.homepage      = 'https://github.com/thejspr/chromarks'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 1.9'

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 3.1'
end
