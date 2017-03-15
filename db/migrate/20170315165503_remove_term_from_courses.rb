class RemoveTermFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :term, :integer
    remove_column :courses, :continuity_id, :integer
  end
end
