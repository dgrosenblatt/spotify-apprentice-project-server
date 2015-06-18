class Genre < ActiveRecord::Base
  has_many :songs

  validates :name, presence: true, uniqueness: true

  def self.random
    order_by_rand.limit(1).first
  end
end
