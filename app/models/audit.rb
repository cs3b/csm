class Audit < ActiveRecord::Base
#  belongs_to :committer, :class_name => 'User', :foreign_key => 'by_id'
attr_accessor :committed_by, :attribute
end
