class RenameTypeToTypeId < ActiveRecord::Migration
  def self.up
    rename_column(:scenarios, :type, :type_id)
  end

  def self.down
    rename_column(:scenarios, :type_id, :type)
  end
end
