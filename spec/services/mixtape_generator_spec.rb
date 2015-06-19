require 'rails_helper'

describe MixtapeGenerator do
  describe '.perform' do
    context 'when a genre and time are specified' do
      it 'creates a mixtape and adds songs to it' do
        time = 2000

        genre = create(:genre)
        song = create_list(:song, 50, genre: genre)

        mixtape = MixtapeGenerator.perform(genre_name: genre.name, time: time)

        expect(mixtape.songs).not_to be_empty
      end
    end

    context 'when only a genre is specified' do
      it 'creates a mixtape and adds songs to it' do
        time = nil

        genre = create(:genre)
        song = create_list(:song, 50, genre: genre)

        mixtape = MixtapeGenerator.perform(genre_name: genre.name, time: time)

        expect(mixtape.songs).not_to be_empty
      end
    end

    context 'when only a time is specified' do
      it 'creates a mixtape and adds songs to it' do
        time = 2000
        genre_name = nil

        genre = create(:genre)
        song = create_list(:song, 50, genre: genre)

        mixtape = MixtapeGenerator.perform(genre_name: genre_name, time: time)

        expect(mixtape.songs).not_to be_empty
      end
    end

    context 'when neither time nor genre is specified' do
      it 'creates a mixtape and adds songs to it' do
        time = nil
        genre_name = nil

        genre = create(:genre)
        song = create_list(:song, 50, genre: genre)

        mixtape = MixtapeGenerator.perform(genre_name: genre_name, time: time)

        expect(mixtape.songs).not_to be_empty
      end
    end
  end
end
