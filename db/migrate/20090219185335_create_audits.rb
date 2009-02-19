class CreateAudits < ActiveRecord::Migration
  def self.up
    create_table :audits, :id => false do |t|
      t.integer :object_type
      t.integer :object_id
      t.integer :attribute_id
      t.string :before
      t.string :after
      t.string :by
      t.integer :by_id
      t.datetime :created_at
    end

    add_index(:audits, [:object_type,:object_id], :name => :objects)
    add_index(:audits, :created_at, :name => :creation_time)
    add_index(:audits, :by_id, :name => :creator)
  end

  def self.down
    drop_table :audits
    remove_index :audits, :name => :objects
    remove_index :audits, :name => :creation_time
    remove_index :audits, :name => :creator
  end
end
