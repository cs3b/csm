class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :title
      t.string :what
      t.string :who
      t.string :why

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
