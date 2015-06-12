require 'rails_helper'

describe 'songs endpoints' do
  describe 'GET /songs' do
    context 'when there are 10 songs or fewer' do
      it 'returns JSON for all songs' do
        create_list(:song, 10)

        get(songs_url, {}, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :songs
      end
    end

    context 'when there are more than 10 songs' do
      context 'when no per_page param is specified' do
        it 'returns JSON for 10 songs' do
          total_songs = 100

          create_list(:song, 100)

          get(songs_url, {}, accept_headers)

          expect(response).to have_http_status :ok
          expect(response).to match_response_schema :songs
          expect(paginated_total).to eq total_songs
          expect(paginated_per_page).to eq 10
        end
      end

      context 'when a per_page param is specified' do
        it 'returns JSON for the number of songs requested' do
          total_songs = 100
          per_page = 5

          create_list(:song, 100)

          get(songs_url, { per_page: 5 }, accept_headers)

          expect(response).to have_http_status :ok
          expect(response).to match_response_schema :songs
          expect(paginated_total).to eq 100
          expect(paginated_per_page).to eq 5
        end
      end
    end

    context 'when there are no songs' do
      it 'returns an empty list of songs' do
        get(songs_url, {}, accept_headers)

        expect(response).to have_http_status :ok
        expect(json['songs'].empty?).to eq true
      end
    end
  end

  describe 'GET /songs/:id' do
    it 'returns JSON for one song' do
      song = create(:song)

      get(song_url(song), {}, accept_headers)

      expect(response).to have_http_status :ok
      expect(response).to match_response_schema :song
    end
  end
end
