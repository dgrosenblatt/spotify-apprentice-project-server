require 'rails_helper'

describe 'songs endpoints' do
  describe 'GET /index' do
    context 'when there are many songs' do
      it 'returns JSON for all songs' do
        songs = create_list(:song, 10)
        get(songs_url, {}, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :songs
      end
    end

    context 'when there are no songs' do
      it 'returns an empty list of songs' do
        get(songs_url, {}, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :songs
      end
    end
  end
end
