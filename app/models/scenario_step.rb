# == Schema Information
# Schema version: 20090221092802
#
# Table name: scenario_steps
#
#  id          :integer(4)      not null, primary key
#  keyword_id  :integer(4)
#  instruction :string(255)
#  parent_id   :integer(4)
#  scenario_id :integer(4)
#  position    :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  deleted_at  :datetime
#

class ScenarioStep < ActiveRecord::Base

  acts_as_paranoid

  default_scope :order => :keyword_id

  has_many :children, :class_name => 'ScenarioStep', :foreign_key => :parent_id, :dependent => :destroy
  has_many :small_changes, :class_name => 'Audit', :foreign_key => 'object_id', :conditions => {:object_type => Audit::KEYS[:scenario_step]}
  belongs_to :parent, :class_name => 'ScenarioStep', :foreign_key => 'parent_id'

  before_save :audit_changes
  before_destroy :audit_deletion

  attr_accessor :committed_by
  
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

  private
  
  def audit_changes
    changed.each do |attribute|
      before = "#{"#{I18n.t(KEYWORDS.invert[keyword_id])} " unless new_record?}"+send("#{attribute}_was").to_s
      after = "#{I18n.t(KEYWORDS.invert[keyword_id])} "+send(attribute).to_s
      small_changes.build(:before => before, :after => after, :attribute => attribute.to_sym) if attribute == 'instruction'
    end
  end

  def audit_deletion
    [:instruction].each do |attribute|
      before = "#{I18n.t(KEYWORDS.invert[keyword_id])} "+send("#{attribute}_was").to_s
      small_changes.build(:before => before, :after => nil, :attribute => attribute).save
    end
  end

end
