# == Schema Information
# Schema version: 20090221092802
#
# Table name: scenarios
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  feature_id :integer(4)
#  position   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

class Scenario < ActiveRecord::Base

  acts_as_paranoid
  
  belongs_to :feature
  has_many :steps, :class_name => 'ScenarioStep', :dependent => :destroy
  has_many :main_steps, :class_name => 'ScenarioStep', :conditions => {:keyword_id => ScenarioStep::MAIN_KEYWORDS.values}
  has_many :small_changes, :class_name => 'Audit', :foreign_key => 'object_id', :conditions => {:object_type => Audit::KEYS[:scenario]}

  before_save :audit_changes
  before_destroy :audit_deletion

  attr_accessor :committed_by

  accepts_nested_attributes_for :steps

  private

  def audit_changes
    changed.each do |attribute|
      small_changes.build(:before => send("#{attribute}_was"), :after => send(attribute), :attribute => attribute.to_sym) unless ['feature_id'].include?(attribute)
    end
  end

  def audit_deletion
    [:title].each do |attribute|
      small_changes.build(:before => send("#{attribute}_was"), :after => nil, :attribute => attribute).save
    end
  end
end
