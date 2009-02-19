# == Schema Information
# Schema version: 20090101184824
#
# Table name: scenarios
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  feature_id :integer(4)
#  position   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Scenario < ActiveRecord::Base
  belongs_to :feature
  has_many :changes, :class_name => 'Audit', :foreign_key => 'object_id', :conditions => {:object_id => :scenario}
  has_many :steps, :class_name => 'ScenarioStep'
  has_many :main_steps, :class_name => 'ScenarioStep', :conditions => {:keyword_id => ScenarioStep::MAIN_KEYWORDS.values}

  accepts_nested_attributes_for :steps

end
