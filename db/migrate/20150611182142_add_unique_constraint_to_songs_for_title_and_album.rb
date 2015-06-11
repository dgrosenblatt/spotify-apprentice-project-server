class AddUniqueConstraintToSongsForTitleAndAlbum < ActiveRecord::Migration
  def change
    add_index :songs, [:title, :album], unique: true
  end
end
