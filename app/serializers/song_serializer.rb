class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :album, :duration, :artist_id
  embed :ids, include: true
  has_one :artist
end
