require 'rails_helper'

describe 'mixtape endpoints' do
  describe 'GET /mixtape' do
    before do
      genre = create(:genre)
      create_list(:song, 10, genre: genre)
      @genre_name = genre.name
    end

    context 'when a genre and time are specified' do
      it 'responds with JSON for a mixtape' do
        get(mixtape_url, { genre: @genre_name, time: 2000 }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
      it 'creates a mixtape' do
        allow(MixtapeGenerator).to receive(:perform)

        get(mixtape_url, { genre: @genre_name, time: 2000 }, accept_headers)

        expect(MixtapeGenerator).to have_received(:perform)
      end
    end

    context 'when only a genre is specified' do
      it 'responds with JSON for a mixtape' do
        get(mixtape_url, { genre: @genre_name }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
      it 'creates a mixtape' do
        allow(MixtapeGenerator).to receive(:perform)

        get(mixtape_url, { genre: @genre_name }, accept_headers)

        expect(MixtapeGenerator).to have_received(:perform)
      end
    end

    context 'when only a time is specified' do
      it 'responds with a mixtape for a randomly selected genre' do
        get(mixtape_url, { time: 2000 }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
      it 'creates a mixtape' do
        allow(MixtapeGenerator).to receive(:perform)

        get(mixtape_url, { time: 2000 }, accept_headers)

        expect(MixtapeGenerator).to have_received(:perform)
      end
    end

    context 'when neither a genre nor time specified' do
      it 'responds with a mixtape for a randomly selected genre' do
        get(mixtape_url, { }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
      it 'creates a mixtape' do
        allow(MixtapeGenerator).to receive(:perform)

        get(mixtape_url, { }, accept_headers)

        expect(MixtapeGenerator).to have_received(:perform)
      end
    end
  end
end
