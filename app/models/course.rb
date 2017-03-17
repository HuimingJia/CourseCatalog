class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :users, :through => :enrollments
  has_many :relationships, class_name:  "Relationship",
                           foreign_key: "course_id",
                           dependent:   :destroy
  has_many :subjects, :through => :relationships
end
