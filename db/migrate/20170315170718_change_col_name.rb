class ChangeColName < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :credites, :credits
  end
end
