require 'rails_helper'

describe Song do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of(:title).scoped_to(:album) }
    it { should validate_presence_of :artist_id }
    it { should validate_presence_of :album }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of(:duration).is_greater_than(0) }
    it { should validate_presence_of :spotify_uri }
    it { should validate_uniqueness_of :spotify_uri }
  end

  describe 'associations' do
    it { should belong_to :artist }
  end
end
