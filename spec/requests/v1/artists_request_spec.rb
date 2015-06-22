require 'rails_helper'

describe 'artists endpoints' do
  describe 'GET /artists' do
    context 'when there are 10 artists or fewer' do
      it 'returns JSON for all artists' do
        artists = create_list(:artist, 3)

        get(artists_url, {}, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :artists
      end
    end

    context 'when there are more than 10 artists' do
      context 'when no per_page param is specified' do
        it 'returns JSON for 10 artists' do
          total_songs = 100

          create_list(:artist, total_songs)

          get(artists_url, {}, accept_headers)

          expect(response).to have_http_status :ok
          expect(response).to match_response_schema :artists
          expect(paginated_total).to eq total_songs
          expect(paginated_per_page).to eq 10
        end
      end

      context 'when a per_page param is specified' do
        it 'returns JSON for the number of artists requested' do
          total_songs = 100
          per_page = 5

          create_list(:artist, 100)

          get(artists_url, { per_page: 5 }, accept_headers)

          expect(response).to have_http_status :ok
          expect(response).to match_response_schema :artists
          expect(paginated_total).to eq total_songs
          expect(paginated_per_page).to eq per_page
        end
      end
    end
  end

  describe 'POST /artists' do
    context 'when required fields are provided' do
      it 'creates an artist' do
        params = {
          name: 'The Rolling Stones',
          description: 'A rock band from England',
          spotify_uri: 'http://spotify.com/rolling-stones'
        }

        expect{ post_artists(params) }.to change{ Artist.count }.by(1)

        expect(response).to have_http_status :created
        expect(response).to match_response_schema :artist
      end
    end

    context 'with invalid information' do
      context 'missing required fields' do
        it 'should not create an artist' do
          params = {
            name: '',
            description: '',
            spotify_uri: ''
          }

          expect{ post_artists(params) }.not_to change{ Artist.count }

          expect(response).to have_http_status :unprocessable_entity
          expect(errors).to include("can't be blank")
        end
      end

      context 'when an artist with the same spotify_uri already exists' do
        it 'should not create an artist' do
          artist = create(:artist)
          params = {
            name: 'The Rolling Stones',
            description: 'A band from England',
            spotify_uri: artist.spotify_uri
          }

          expect{ post_artists(params) }.not_to change{ Artist.count }

          expect(response).to have_http_status :unprocessable_entity
          expect(errors).to include('Spotify uri has already been taken')
        end
      end
    end
  end
end

def post_artists(params)
  artist_params = { artist: params }
  post(artists_url, artist_params.to_json, accept_headers )
end
