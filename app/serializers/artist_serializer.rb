class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :spotify_uri
  embed :ids
  has_many :songs
end
