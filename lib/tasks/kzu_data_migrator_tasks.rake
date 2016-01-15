namespace :db do
  namespace :data do
    unless Rake::Task.task_defined?("db:data:migrate")
      desc 'Migrate data (KzuDataMigrator)'
      task :migrate => :environment do
        KzuDataMigrator::Migrator.migrate(KzuDataMigrator::Migrator.migrations_paths)
      end
    end

    namespace :migrate do
      unless Rake::Task.task_defined?("db:data:migrate:up")
        desc 'Runs the "up" for a given migration VERSION (KzuDataMigrator)'
        task :up => :environment do
          version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
          raise "VERSION is required" unless version
          KzuDataMigrator::Migrator.run(:up, KzuDataMigrator::Migrator.migrations_paths, version)
        end
      end

      unless Rake::Task.task_defined?("db:data:migrate:down")
        desc 'Runs the "down" for a given migration VERSION (KzuDataMigrator)'
        task :down => :environment do
          version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
          raise "VERSION is required" unless version
          KzuDataMigrator::Migrator.run(:up, KzuDataMigrator::Migrator.migrations_paths, version)
        end
      end
    end
  end
end
