class <%= class_name.underscore.camelize %> < KzuDataMigrator::Migration
  def self.up
  end

  def self.down
    raise IrreversibleMigration
  end
end
