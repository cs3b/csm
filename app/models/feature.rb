# == Schema Information
# Schema version: 20090101184824
#
# Table name: features
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  what       :string(255)
#  who        :string(255)
#  why        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Feature < ActiveRecord::Base
  has_many :scenarios
end
