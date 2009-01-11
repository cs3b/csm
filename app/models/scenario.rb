# == Schema Information
# Schema version: 20090103151236
#
# Table name: scenarios
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  parent_id  :integer(4)
#  position   :integer(4)
#  type_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Scenario < ActiveRecord::Base
  acts_as_ordered_tree :foreign_key => :parent_id, :order => :position
  belongs_to :parent, :class_name => 'Scenario'

  SCENARIO = 0
  ROOT_TYPES = [ SCENARIO ]
  GIVEN = 1
  WHEN = 2
  THEN = 3
  CHILD_TYPES = [ GIVEN, WHEN, THEN ]

  named_scope :given, :conditions => {:type_id => GIVEN}
  named_scope :when, :conditions => {:type_id => WHEN}
  named_scope :then, :conditions => {:type_id => THEN}


  # get content from root (SCENARIO type)
  def title
    root.content
  end

  # should return elements that are type GIVEN and have same parent
  def given
    Scenario.given.find_all_by_parent_id root.id
  end

  # should return elements that are type WHEN and have same parent
  def when
    Scenario.when.find_all_by_parent_id root.id
  end

  # should return elements that are type THEN and have same parent
  def then
    Scenario.then.find_all_by_parent_id root.id
  end
end
