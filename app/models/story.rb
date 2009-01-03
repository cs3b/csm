# == Schema Information
# Schema version: 20090101184824
#
# Table name: stories
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  feature_id  :integer(4)
#

class Story < ActiveRecord::Base
  belongs_to :feature
end
