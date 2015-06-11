class Song < ActiveRecord::Base
  belongs_to :artist
  
  validates :album, presence: true
  validates :artist, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :spotify_uri, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: { scope: :album }
end
