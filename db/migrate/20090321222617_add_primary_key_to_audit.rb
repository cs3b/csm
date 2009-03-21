class AddPrimaryKeyToAudit < ActiveRecord::Migration
  def self.up
    add_column :audits, :id, :primary => true
  end

  def self.down
    remove_column :audits, :id
  end
end
