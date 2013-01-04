require './lib/effer/version'


Gem::Specification.new do |s| 
  s.name = "effer"
  s.version = Effer::VERSION
  s.author = "Steve Loveless"
  s.homepage = "http://github.com/turboladen/effer"
  s.email = "steve.loveless@gmail.com"
  s.summary = %q(FIX)
  s.description = %q(FIX)

  s.required_rubygems_version = ">=1.8.0"
  s.files = Dir.glob("{lib,spec}/**/*") + Dir.glob("*.rdoc") +
    %w(.gemtest Gemfile effer.gemspec Rakefile)
  s.test_files = Dir.glob("{spec}/**/*")
  s.require_paths = ["lib"]

  s.add_dependency "ffi", ">= 1.2.0"

  s.add_development_dependency "bundler", ">= 1.0.1"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", ">= 2.6.0"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "yard", ">= 0.7.2"
end