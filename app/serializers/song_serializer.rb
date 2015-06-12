class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :album, :duration, :full_title

  embed :ids

  has_one :artist

  def full_title
    decorated_song.full_title
  end

  def duration
    decorated_song.duration_in_minutes_and_seconds
  end

  def decorated_song
    @decorated_song ||= object.decorate
  end
end
