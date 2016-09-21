$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'cronjobs/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'cronjobs'
  s.version     = Cronjobs::VERSION
  s.authors     = ['mmontossi']
  s.email       = ['mmontossi@buyin.io']
  s.homepage    = 'https://github.com/mmontossi/cronjobs'
  s.summary     = 'Cronjobs for rails.'
  s.description = 'Extracts models cache logic into separate classes in rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency 'rails', ['>= 4.0.0', '< 4.3.0']

  s.add_development_dependency 'mocha', '~> 1.1'
end
