class Relationship < ApplicationRecord
  belongs_to :subject, :class_name => 'Subject', :foreign_key => 'subject_identifier',:primary_key => 'identifier'
  belongs_to :course, :class_name => 'Course', :foreign_key => 'id'
  validates :course_id, uniqueness: { scope: :subject_identifier}
end
