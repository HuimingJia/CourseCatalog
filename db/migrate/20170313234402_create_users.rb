class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
