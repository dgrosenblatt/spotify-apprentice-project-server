class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :album, :duration, :formatted_duration, :full_title

  embed :ids

  has_one :artist

  def full_title
    decorated_song.full_title
  end

  def formatted_duration
    decorated_song.formatted_duration
  end

  def decorated_song
    @decorated_song ||= object.decorate
  end
end
