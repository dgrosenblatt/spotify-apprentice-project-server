class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :album, :duration
  embed :ids
  has_one :artist
end
