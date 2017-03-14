class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :type
      t.integer :term
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
