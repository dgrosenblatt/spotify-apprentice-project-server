class CreateSongs < ActiveRecord::Migration
  def change    
    create_table :songs, id: :uuid do |t|
      t.timestamps null: false

      t.string :title
      t.string :artist
      t.string :album
      t.integer :duration
      t.string :spotify_uri
    end
  end
end
