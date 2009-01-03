class CreateScenarios < ActiveRecord::Migration
  def self.up
    create_table :scenarios do |t|
      t.string :content
      t.belongs_to :parent
      t.integer :position
      t.integer :type

      t.timestamps
    end
  end

  def self.down
    drop_table :scenarios
  end
end
