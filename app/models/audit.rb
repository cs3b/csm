# == Schema Information
# Schema version: 20090221092802
#
# Table name: audits
#
#  object_type  :integer(4)
#  object_id    :integer(4)
#  attribute_id :integer(4)
#  before       :string(255)
#  after        :string(255)
#  by           :string(255)
#  by_id        :integer(4)
#  created_at   :datetime
#

class Audit < ActiveRecord::Base

  default_scope :order => "created_at DESC"
  belongs_to :user, :class_name => 'User', :foreign_key => 'by_id'

  KEYS =
    {
    :feature => 10,
    :feature_id => 11,
    :title => 12,
    :what => 13,
    :who => 14,
    :why => 15,
    :scenario => 20,
    :scenario_id => 21,
    :scenario_step => 30,
    :instruction => 31,
    :keyword_id => 32,
    :parent_id => 33
  }

  #  belongs_to :committer, :class_name => 'User', :foreign_key => 'by_id'
  attr_accessor :committed_by, :attribute

  before_validation :attribute_symbols_to_fixnum
  before_save :set_author

  def attribute_symbol
    KEYS.invert[attribute_id]
  end

  def self.prepare_conditions(type, object_id)
    type = type.to_sym
    conditions = case type
    when :feature
      %{
        (object_type = #{Audit::KEYS[:feature]} and object_id = #{object_id}) or
        (object_type = #{Audit::KEYS[:scenario]} and object_id IN (SELECT id FROM `scenarios` WHERE (`scenarios`.`feature_id` = #{object_id} ))) or
        (
          object_type = #{Audit::KEYS[:scenario_step]} and object_id IN
          (
            SELECT id FROM `scenario_steps` WHERE
            (
              (`scenario_steps`.`scenario_id` IN ( SELECT id FROM `scenarios` WHERE (`scenarios`.`feature_id` = #{object_id})) ) or
              (`scenario_steps`.`parent_id` IN (SELECT id FROM `scenario_steps` WHERE (`scenario_steps`.`scenario_id` IN ( SELECT id FROM `scenarios` WHERE (`scenarios`.`feature_id` = #{object_id})))))
            )
          )
        )
      }
    when :scenario
      %{
        (object_type = #{Audit::KEYS[:scenario]} and object_id = #{object_id})s or
        (object_type = #{Audit::KEYS[:scenario_step]} and object_id IN (SELECT id FROM `scenario_steps` WHERE (`scenario_steps`.`scenario_id` = #{object_id} )))
      }
    when :scenario_step
      %{
        (object_type = #{Audit::KEYS[:scenario_step]} and object_id = #{object_id})
      }
    end
    conditions.gsub!("\n", "")
    conditions.gsub!(/\s+/, " ")
  end

  private
 
  def attribute_symbols_to_fixnum
    raise "Udefined key: #{attribute}" unless KEYS.keys.include?(attribute)
    self.attribute_id = KEYS[attribute]
  end

  def set_author
    self.by = committed_by.email
    self.by_id = committed_by.id
  end
end
