module KzuDataMigrator
  class Migration < ActiveRecord::Migration
    def load_schema_if_pending!
      if Rails.env.development?
        raise StandardError.new("unsupported method load_schema_if_pending! for KzuDataMigrator::Migration")
      else
        Rails.logger.warn("KzuDataMigrator::Migration.load_schema_if_pending! should not be called")
      end
    end

    def maintain_test_schema!
      if Rails.env.development?
        raise StandardError.new("unsupported method maintain_test_schema! for KzuDataMigrator::Migration")
      else
        Rails.logger.warn("KzuDataMigrator::Migration.maintain_test_schema! should not be called")
      end
    end
  end
end
