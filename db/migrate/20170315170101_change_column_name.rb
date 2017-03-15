class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :repuirements, :requirements
    change_column :courses, :independent_study, :string
  end
end
