class AddIdToInstructor < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :identifier, :string
  end
end
