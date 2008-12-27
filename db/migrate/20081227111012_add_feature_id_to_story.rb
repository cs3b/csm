class AddFeatureIdToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :feature_id, :integer
  end

  def self.down
    remove_column :stories, :feature_id
  end
end
