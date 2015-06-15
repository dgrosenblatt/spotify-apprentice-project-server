class Mixtape
  include ActiveModel::SerializerSupport

  attr_reader :songs

  def initialize(genre:,songs:)
    @genre = genre
    @songs = songs
  end
end
