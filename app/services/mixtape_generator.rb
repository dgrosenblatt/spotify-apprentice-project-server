class MixtapeGenerator
  attr_reader :genre_name

  def initialize(genre_name:)
    @genre_name = genre_name
  end

  def self.perform(genre_name:)
    new(genre_name: genre_name).perform
  end

  def perform
    Mixtape.new(songs: pick_songs)
  end

  def pick_songs
    Song.includes(:genre, :artist)
        .joins(:genre, :artist)
        .where("lower(genres.name) = ?", genre_name.downcase)
        .order_by_rand
  end
end
