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
  #TODO take something new, acts_as_list+tree - scope in position should more work properly
  acts_as_ordered_tree :foreign_key => :parent_id,
    :order       => :position, :scope => [:parent_id, :keyword_id]

  default_scope :order => :keyword_id

  has_many :children, :class_name => 'ScenarioStep', :foreign_key => :parent_id
  accepts_nested_attributes_for :children

  # main keywords, differnt type of step
  MAIN_KEYWORDS = {
    :given => 101,
    :when => 102,
    :then => 103
  }
  # link keywords, sibblings of main type step
  LINK_KEYWORDS = {
    :and => 201,
    :but => 202
  }

  # main and link keywords together
  # use for converting keyword_id from db to keyword symbol
  KEYWORDS = MAIN_KEYWORDS.merge LINK_KEYWORDS

  # return keyword string
  #TODO should work on arrays from cucumber
  def keyword
    KEYWORDS.invert[keyword_id]
  end

  # get connected scenario
  # bacause child doesn't have information about scenario, only parent have
  # this make it little bit more complicated (i don't know how to resolve
  # that with belongs_to helper
  def scenario
    if scenario_id
      _id = scenario_id
    elsif parent.scenario_id
      _id = parent.scenario_id
    else
      raise "Assosiation not found ScenarioStep\##{id}: scenario"
    end
    Scenario.find(_id)
  end

end
