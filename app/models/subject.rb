class Subject < ApplicationRecord
  has_many :relationships, class_name:  "Relationship",
                           foreign_key: "subjectidentifier",
                           primary_key: "identifier",
                           dependent:   :destroy
  has_many :courses, :through => :relationships
end
