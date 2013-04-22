require File.expand_path('../lib/constant_contact/version', __FILE__)

Gem::Specification.new do |s|
	s.name        = "constant_contact"
	s.version     = ConstantContact::VERSION
	s.platform    = Gem::Platform::RUBY
	s.authors     = ["Tim Case", "Ed Hickey", "Nathan Hyde", "Idris Mokhtarzada", "Aaron Ten Clay"]
	s.email       = "aarontc@aarontc.com"
	s.homepage    = "https://github.com/aarontc/constant_contact"
	s.summary     = "ActiveResource wrapper for the Constant Contact API."
	s.description = "ActiveResource wrapper for the Constant Contact API."

	s.required_rubygems_version = '>= 1.3.6'

  s.add_runtime_dependency('activesupport', '~> 4.0.0.beta')
	s.add_runtime_dependency('activeresource', '~> 4.0.0.beta')
	s.add_runtime_dependency('builder', '~> 3.0')

	s.add_development_dependency("shoulda")
	s.add_development_dependency("mocha")
	s.add_development_dependency("fakeweb")

	s.files        = Dir.glob("{lib,test}/**/*") + %w(MIT-LICENSE README.md)
	s.test_files   = Dir.glob("test/constant_contact/*_test.rb")
	s.require_path = 'lib'
end
