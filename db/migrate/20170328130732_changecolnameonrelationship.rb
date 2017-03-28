class Changecolnameonrelationship < ActiveRecord::Migration[5.0]
  def change
    rename_column :relationships, :subjectidentifier, :subject_id
  end
end
