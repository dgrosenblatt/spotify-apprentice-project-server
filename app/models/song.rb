class Song < ActiveRecord::Base
  belongs_to :artist

  validates :title, presence: true, uniqueness: { scope: :album }
  validates :artist_id, presence: true
  validates :album, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :spotify_uri, presence: true, uniqueness: true
end
