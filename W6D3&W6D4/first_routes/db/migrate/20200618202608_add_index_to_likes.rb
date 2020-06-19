class AddIndexToLikes < ActiveRecord::Migration[5.2]
  def change
  end

  add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true

end
