class KzuDataMigratorGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  include Rails::Generators::Migration

    def create_migration_file
      migration_template 'migration.rb', "db/data-migrate/#{file_name}.rb"
    end

  class << self
    # Implement the required interface for Rails::Generators::Migration.
    def next_migration_number(dirname)
      next_migration_number = current_migration_number(dirname) + 1
      [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d" % next_migration_number].max
    end
  end
end
