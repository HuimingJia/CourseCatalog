class RemoveIdentifierFromCourse < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :identifier, :string
  end
end
