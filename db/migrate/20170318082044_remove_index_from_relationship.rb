class RemoveIndexFromRelationship < ActiveRecord::Migration[5.0]
  def change
    remove_index :relationships, :subjectidentifier if index_exists?(:relationships, :subjectidentifier)
    remove_index :relationships, :course_id if index_exists?(:relationships, :course_id)
    remove_index :relationships, [:subjectidentifier, :course_id] if index_exists?(:relationships, [:subjectidentifier, :course_id])
  end
end
