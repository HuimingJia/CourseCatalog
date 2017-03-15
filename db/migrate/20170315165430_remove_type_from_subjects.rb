class RemoveTypeFromSubjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :subjects, :type, :string
  end
end
