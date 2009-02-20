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
  has_many :steps, :class_name => 'ScenarioStep'
  has_many :main_steps, :class_name => 'ScenarioStep', :conditions => {:keyword_id => ScenarioStep::MAIN_KEYWORDS.values}
  has_many :small_changes, :class_name => 'Audit', :foreign_key => 'object_id', :conditions => {:object_type => :scenario.to_i}

  before_save :audit_changes
  before_destroy :audit_deletion

  attr_accessor :committed_by

  accepts_nested_attributes_for :steps

  private
  def audit_changes
    changed.each do |attribute|
      small_changes.build(:before => send("#{attribute}_was"), :after => send(attribute), :attribute_id => attribute.to_sym, :committed_by => committed_by)
    end
  end

  def audit_deletion
    [:title, :what, :who, :why].each do |attribute|
      small_changes.build(:before => send("#{attribute}_was"), :after => nil, :attribute_id => attribute, :committed_by => committed_by)
    end
  end

end
