class AddCourseIdToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :course_id, :string
  end
end
