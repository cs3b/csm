class AddPrimaryKeyToAudit < ActiveRecord::Migration
  def self.up
    add_column :audits, :id, :primary_key
  end

  def self.down
    remove_column :audits, :id
  end
end
