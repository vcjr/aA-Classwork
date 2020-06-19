class ChangeUser < ActiveRecord::Migration[5.2]
  def change
      remove_column :users, :email
      remove_column :users, :favorite_food

      rename_column :users, :name, :username

  end
end
