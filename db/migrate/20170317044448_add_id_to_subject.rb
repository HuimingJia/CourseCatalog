class AddIdToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :identifier, :string
  end
end
