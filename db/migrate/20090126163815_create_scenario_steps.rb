class CreateScenarioSteps < ActiveRecord::Migration
  def self.up
    create_table :scenario_steps do |t|
      t.integer :keyword_id
      t.string :instruction
      t.boolean :main
      t.belongs_to :scenario
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :scenario_steps
  end
end
