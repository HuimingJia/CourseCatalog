class Relationship < ApplicationRecord
  belongs_to :subject,:class_name => 'Subject',foreign_key: 'subject_id', primary_key: 'identifier'
  belongs_to :course, :class_name => 'Course', foreign_key: 'id'
end
