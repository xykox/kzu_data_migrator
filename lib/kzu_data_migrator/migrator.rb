module KzuDataMigrator
  class Migrator < ActiveRecord::Migrator
    def initialize(direction, migrations, target_version = nil)
      raise StandardError.new("This database does not yet support migrations") unless ActiveRecord::Base.connection.supports_migrations?

      @direction         = direction
      @target_version    = target_version
      @migrated_versions = nil
      @migrations        = migrations

      validate(@migrations)

      self.class.initialize_data_migrations_table
    end

    class << self
      def migrations_paths
        ['db/data-migrate']
      end

      def schema_migrations_table_name
        KzuDataMigrator::DataMigrationVersion.table_name
      end

      def get_all_versions
        KzuDataMigrator::DataMigrationVersion.all.map { |x| x.version.to_i }.sort
      end

      def initialize_data_migrations_table
        # TODO : connection_adapters/mysql2_adapter.rb : initialize_schema_migrations_table
        KzuDataMigrator::DataMigrationVersion.create_table
      end
    end
          
    private

    def record_version_state_after_migrating(version)
      if down?
        migrated.delete(version)
        KzuDataMigrator::DataMigrationVersion.where(:version => version.to_s).delete_all
      else
        migrated << version
        KzuDataMigrator::DataMigrationVersion.create!(:version => version.to_s)
      end
    end
  end
end
