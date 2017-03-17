class Course < ApplicationRecord
  has_many :enrollment
  has_many :users, through: :enrollments
end
