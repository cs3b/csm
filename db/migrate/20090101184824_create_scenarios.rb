class CreateScenarios < ActiveRecord::Migration
  def self.up
    create_table :scenarios do |t|
      t.string :title
      t.belongs_to :feature
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :scenarios
  end
end
