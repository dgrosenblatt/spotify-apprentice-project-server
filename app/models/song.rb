class Song < ActiveRecord::Base
  validates :title,
    presence: true

  validates :artist,
    presence: true

  validates :album,
    presence: true

  validates :duration,
    presence: true
end
