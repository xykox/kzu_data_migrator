module KzuDataMigrator
  require 'rails'

  class Railtie < Rails::Railtie
    rake_tasks { load "tasks/kzu_data_migrator_tasks.rake" }
  end
end
