require 'rails_helper'

describe 'Artist Decorator' do
  describe 'decoration associations' do
    it 'decorates associated songs' do
      create(:song)
      artists = Artist.includes(:songs).decorate
      song = artists.first.songs.first

      expect(song.respond_to?('full_title')).to eq true
      expect(song.respond_to?('duration_in_minutes_and_seconds')).to eq true
    end
  end
end
