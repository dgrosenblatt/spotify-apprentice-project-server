class MixtapeGenerator
  def initialize(genre:)
    @genre = genre
  end

  def self.perform(genre:)
    new(genre: genre).perform
  end

  def perform
    Mixtape.new(genre: @genre, songs: pick_songs)
  end

  def pick_songs
    Song.order_by_rand
        .includes(:genre, :artist)
        .joins(:genre, :artist)
        .where("lower(genres.name) = ?", @genre.downcase)
  end
end
