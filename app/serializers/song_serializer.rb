class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :album, :duration
end
