require 'rails_helper'

describe 'Song Decorator' do
  describe '#formatted_duration' do
    it 'returns a string representation of the duration of a song in minutes and seconds' do
      song = create(:song, duration: 100)
      decorated = song.decorate

      expect(decorated.formatted_duration).to eq '1:40'
    end
  end

  describe '#full_title' do
    it 'returns the artist name, title, and album of a song' do
      artist = create(:artist, name: 'Foo')
      song = create(:song, artist: artist, title: 'Bar', album: 'Baz')
      decorated = song.decorate

      expect(decorated.full_title).to eq 'Foo - Bar - Baz'
    end
  end
end
