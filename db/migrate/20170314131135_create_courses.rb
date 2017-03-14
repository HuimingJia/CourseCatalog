class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :type
      t.integer :term
      t.string :code
      t.integer :continuity_id
      t.string :name
      t.text :description
      t.integer :credites
      t.boolean :independent_study
      t.string :repuirements

      t.timestamps
    end
  end
end
