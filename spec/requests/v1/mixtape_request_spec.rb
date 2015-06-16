require 'rails_helper'

describe 'mixtape endpoints' do
  describe 'GET /mixtape' do
    context 'with one genre specified' do
      it 'responds with JSON for a mixtape' do
        get(mixtape_url, { genre: 'blues' }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
    end
    context 'with a genre and time in seconds specified' do
      it 'responds with JSON for a mixtape' do
        get(mixtape_url, { genre: 'blues', time: 3600 }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
    end
  end
end
