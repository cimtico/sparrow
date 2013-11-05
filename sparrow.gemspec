Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'sparrow'
  s.version     = '1.0.0'
  s.summary     = 'Sparrow queue fix'
  s.description = 'Sparrow queue fix'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.11'

  s.license = 'MIT'

  s.author   = 'Alex MacCAw'
  s.email    = 'maccman@gmail.com'
  s.homepage = 'https://code.google.com/p/sparrow/'

  s.files         = Dir["CHANGELOG.md", "MIT-LICENSE", "README.txt", "lib/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency 'bundler',         '>= 1.3.0', '< 2.0'
end