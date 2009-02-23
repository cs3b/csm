# == Schema Information
# Schema version: 20090221092802
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
#  deleted_at :datetime
#

class Feature < ActiveRecord::Base

  acts_as_paranoid

  has_many :scenarios, :dependent => :destroy
  has_many :feature_changes, :class_name => 'Audit', :foreign_key => 'object_id', :conditions => {:object_type => Audit::KEYS[:feature]}

  before_save :audit_changes
  after_destroy :audit_deletion

  attr_accessor :committed_by

  private

  def audit_changes
    changed.each do |attribute|
      feature_changes.build(:before => send("#{attribute}_was"), :after => send(attribute), :attribute => attribute.to_sym)
    end
  end

  def audit_deletion
    [:title, :who, :what, :why].each do |attribute|
      feature_changes.build(:before => send("#{attribute}_was"), :after => nil, :attribute => attribute).save
      end
    end
  end
