class RemoveTypeFromInstructors < ActiveRecord::Migration[5.0]
  def change
    remove_column :instructors, :type, :string
  end
end
