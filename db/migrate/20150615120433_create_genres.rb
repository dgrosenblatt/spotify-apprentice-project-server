class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres, id: :uuid do |t|
      t.timestamps null: false

      t.string :name
    end

    add_reference :songs, :genre, type: :uuid, index: true, foreign_key: true
  end
end
