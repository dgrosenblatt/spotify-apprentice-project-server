require 'rails_helper'

describe 'Song Decorator' do
  describe '#duration_in_minutes_and_seconds' do
    it 'returns the duration of a song in minutes and seconds' do
      song = create(:song, duration: 100)
      decorated = song.decorate

      expect(decorated.duration_in_minutes_and_seconds).to eq '1:40'
    end
  end
end
