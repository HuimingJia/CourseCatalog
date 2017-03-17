class AddIndexToIdentifier < ActiveRecord::Migration[5.0]
  def change
    add_index :courses, :identifier
    add_index :subjects, :identifier
    add_index :instructors, :identifier
  end
end
