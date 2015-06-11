class AddArtistIdToSongs < ActiveRecord::Migration
  def change
    add_reference :songs, :artist, type: :uuid, index: true, foreign_key: true

    remove_column :songs, :artist, :string
  end
end
