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
    context 'with multiple genres specified' do
    end
    context 'with multiple genres and a time specified' do
    end
  end
end
