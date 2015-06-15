class Mixtape
  include ActiveModel::SerializerSupport

  attr_reader :songs

  def initialize(genre)
    @genre = genre
    @songs = pick_songs(@genre)
  end

  def pick_songs(genre)
    Song.includes(:genre, :artist)
        .joins(:genre, :artist)
        .where("lower(genres.name) = ?", genre.downcase)
  end
end
