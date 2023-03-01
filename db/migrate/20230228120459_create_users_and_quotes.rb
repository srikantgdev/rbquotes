class CreateUsersAndQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
    end
    create_table :quotes do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
