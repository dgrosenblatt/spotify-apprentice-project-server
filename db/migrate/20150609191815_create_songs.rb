class CreateSongs < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :songs, id: :uuid do |t|
      t.timestamps null: false

      t.string :title
      t.string :artist
      t.string :album
      t.integer :duration
    end
  end
end
