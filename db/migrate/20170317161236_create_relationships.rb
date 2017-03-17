class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.string :subject_identifier
      t.integer :course_id

      t.timestamps
    end

    add_index :relationships, :subject_identifier
    add_index :relationships, :course_id
    add_index :relationships, [:subject_identifier, :course_id], unique: true
  end
end
