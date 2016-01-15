module KzuDataMigrator
  class DataMigrationVersion < ActiveRecord::SchemaMigration
    class << self
      def data_migrations_table_name
        # TODO : ActiveRecord::Base.data_migrations_table_name
        'data_migrations'
      end

      def table_name
        "#{table_name_prefix}#{data_migrations_table_name}#{table_name_suffix}"
      end

      def index_name
        "#{table_name_prefix}unique_#{data_migrations_table_name}#{table_name_suffix}"
      end
    end
  end
end
