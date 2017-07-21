$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rounders/rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rounders-rails'
  s.version     = Rounders::Rails::VERSION
  s.authors     = ['Akira Takahashi']
  s.email       = ['rike422@gmail.com']
  s.homepage    = 'https://github.com/rike422/rounders-rails'
  s.summary     = 'Ease Rounders integration with Rails'
  s.description = 'Ease Rounders integration with Rails'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 4.2.8'
  s.add_dependency 'rounders', '>= 0.7.0'
  s.add_dependency 'daemons'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rubocop'
end
