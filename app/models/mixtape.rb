class Mixtape
  include ActiveModel::SerializerSupport

  attr_reader :songs

  def initialize(songs:)
    @songs = songs
  end
end
