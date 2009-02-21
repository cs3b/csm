class AddDeletedAtToAudit < ActiveRecord::Migration
  def self.up
    add_column :features, :deleted_at, :datetime, :default => nil
    add_column :scenarios, :deleted_at, :datetime, :default => nil
    add_column :scenario_steps, :deleted_at, :datetime, :default => nil
  end

  def self.down
    remove_column :features, :deleted_at
    remove_column :scenarios, :deleted_at
    remove_column :scenario_steps, :deleted_at
  end
end
