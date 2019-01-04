# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "selenium_statistics"
  spec.version       = "0.3.0"
  spec.authors       = ["Titus Fortner"]
  spec.email         = ["titusfortner@gmail.com"]
  spec.summary       = %q{Generate information about Selenium commands}
  spec.description   = %q{Generate information about Selenium commands}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "selenium-webdriver"

end
