class MixtapeGenerator
  attr_reader :genre_name, :time

  def initialize(genre_name:, time: 3600)
    @genre_name = genre_name
    @time = time
  end

  def self.perform(genre_name:, time: 3600)
    new(genre_name: genre_name, time: time).perform
  end

  def perform
    Mixtape.new(songs: pick_songs)
  end

  def pick_songs
    Song.includes(:genre, :artist).where('songs.id in (?)', song_ids)
  end

  def song_ids
    duration = 0
    song_ids = []
    Song.joins(:genre)
        .where("lower(genres.name) = ?", genre_name.downcase)
        .order_by_rand.find_each do |song|
          song_ids << song.id
          duration += song.duration
          return song_ids if duration > time
        end
  end
end
