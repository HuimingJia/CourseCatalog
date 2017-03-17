class AddIdToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :identifier, :string
  end
end
