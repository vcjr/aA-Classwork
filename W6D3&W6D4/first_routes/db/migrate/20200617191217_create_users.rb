class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :favorite_food, null: true
      t.text :name, null: false
      t.text :email, null: false
    end
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end
