require 'rails_helper'

describe 'mixtape endpoints' do
  describe 'GET /mixtape' do
    before(:each) do
      allow(MixtapeGenerator).to receive(:perform)
    end
    context 'with one genre specified' do
      it 'responds with JSON for a mixtape' do
        get(mixtape_url, { genre: 'blues' }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
      it 'creates a mixtape' do
        get(mixtape_url, { genre: 'blues' }, accept_headers)

        expect(MixtapeGenerator).to have_received(:perform)
      end
    end

    context 'with a genre and time in seconds specified' do
      it 'responds with JSON for a mixtape' do
        get(mixtape_url, { genre: 'blues', time: 3600 }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
      it 'creates a mixtape' do
        get(mixtape_url, { genre: 'blues' }, accept_headers)

        expect(MixtapeGenerator).to have_received(:perform)
      end
    end

    context 'without genre or time specified' do
      it 'responds with a mixtape for a randomly selected genre' do
        create_list(:song, 10)
        get(mixtape_url, { }, accept_headers)

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema :mixtape
      end
      it 'creates a mixtape' do
        get(mixtape_url, { genre: 'blues' }, accept_headers)

        expect(MixtapeGenerator).to have_received(:perform)
      end
    end
  end
end
