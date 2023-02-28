class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.references :users
      t.timestamps
    end
  end
end
