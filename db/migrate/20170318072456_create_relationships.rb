class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :course_id
      t.string :subjectidentifier

      t.timestamps
    end

    add_index :relationships, :subjectidentifier
    add_index :relationships, :course_id
    add_index :relationships, [:subjectidentifier, :course_id], unique: true
  end
end
