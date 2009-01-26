# == Schema Information
# Schema version: 20090126163815
#
# Table name: scenario_steps
#
#  id          :integer(4)      not null, primary key
#  keyword_id  :integer(4)
#  instruction :string(255)
#  main        :boolean(1)
#  scenario_id :integer(4)
#  position    :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class ScenarioStep < ActiveRecord::Base
  belogns_to :scenario
end
