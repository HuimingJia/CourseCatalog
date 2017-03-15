class RemoveCreditAndRequirementFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :credit, :string
    remove_column :courses, :requirement, :string
  end
end
