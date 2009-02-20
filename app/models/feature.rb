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
  #  extend Auditable
  has_many :small_changes, :class_name => 'Audit', :foreign_key => 'object_id', :conditions => {:object_type => :feature.to_i}

  before_save :audit_changes
  before_destroy :audit_deletion

  attr_accessor :committed_by

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
