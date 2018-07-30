$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "wurk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wurk"
  s.version     = Wurk::VERSION
  s.authors     = ["Guido Tarsia"]
  s.email       = ["guidotarsia@gmail.com"]
  s.homepage    = "https://github.com/gtarsia/wurk"
  s.summary     = "Summary of Wurk."
  s.description = "Description of Wurk."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
