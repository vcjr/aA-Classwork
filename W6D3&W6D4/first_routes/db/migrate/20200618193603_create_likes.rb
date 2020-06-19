class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :likeable_type
      t.integer :likeable_id

      t.timestamps
    end
    add_index :likes, [:likeable_type, :likeable_id]
  end
end
