require './lib/effing/version'


Gem::Specification.new do |s| 
  s.name = 'effing'
  s.version = Effing::VERSION
  s.author = 'Steve Loveless'
  s.homepage = 'http://github.com/turboladen/effing'
  s.email = 'steve.loveless@gmail.com'
  s.summary = %q(FIX)
  s.description = %q(FIX)

  s.required_rubygems_version = '>=1.8.0'
  s.files = Dir.glob('{lib,spec}/**/*') + Dir.glob('*.rdoc') +
    %w(.gemtest Gemfile effing.gemspec Rakefile)
  s.test_files = Dir.glob('{spec}/**/*')
  s.require_paths = %w[lib]

  s.add_dependency 'ffi', '>= 1.2.0'
  s.add_dependency 'log_switch', '>= 0.4.0'

  s.add_development_dependency 'bundler', '>= 1.0.1'
  s.add_development_dependency 'fakefs'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '>= 2.6.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'yard', '>= 0.7.2'
end
