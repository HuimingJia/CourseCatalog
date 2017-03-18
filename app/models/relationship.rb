class Relationship < ApplicationRecord
  belongs_to :subject,:class_name => 'Subject',foreign_key: 'subjectidentifier', primary_key: 'identifier'
  belongs_to :course, :class_name => 'Course', foreign_key: 'id'
end
