class AddIndexToEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_index :enrollments, :user_id
    add_index :enrollments, :course_id
    add_index :enrollments, [:user_id, :course_id], unique: true
  end
end
