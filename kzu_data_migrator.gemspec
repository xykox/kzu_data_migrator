$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kzu_data_migrator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kzu_data_migrator"
  s.version     = KzuDataMigrator::VERSION
  s.authors     = ["Jean Marc Delafont"]
  s.email       = ["jmdelafont@xykox.net"]
  s.homepage    = "https://github.com/xykox/kzu_data_migrator"
  s.summary     = "Another data migrator to separate data migration from schema migration"
  s.description = "Another data migrator to separate data migration from schema migration"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
