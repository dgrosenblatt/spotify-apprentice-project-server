class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :album, :duration, :full_title

  embed :ids

  has_one :artist

  def duration
    object.duration_in_minutes_and_seconds
  end
end
