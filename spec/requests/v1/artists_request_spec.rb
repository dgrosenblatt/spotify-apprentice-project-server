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
          artists = create_list(:artist, 100)

          get(artists_url, {}, accept_headers)

          expect(response).to have_http_status :ok
          expect(response).to match_response_schema :artists
          expect(response.headers['Total']).to eq '100'
          expect(response.headers['Per-Page']).to eq '10'
        end
      end

      context 'when a per_page param is specified' do
        it 'returns JSON for the number of artists requested' do
          artists = create_list(:artist, 100)

          get(artists_url, { per_page: 5 }, accept_headers)

          expect(response).to have_http_status :ok
          expect(response).to match_response_schema :artists
          expect(response.headers['Total']).to eq '100'
          expect(response.headers['Per-Page']).to eq '5'
        end
      end
    end
  end
end
