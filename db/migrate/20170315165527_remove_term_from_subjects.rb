class RemoveTermFromSubjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :subjects, :term, :integer

  end
end
