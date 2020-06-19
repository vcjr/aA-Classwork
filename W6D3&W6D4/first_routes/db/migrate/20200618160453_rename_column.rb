class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :artwork_shares, :artist_id, :viewer_id
  end
end
