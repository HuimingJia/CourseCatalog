class RemoveColFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :credits, :integer
    remove_column :courses, :requirements, :string
  end
end
