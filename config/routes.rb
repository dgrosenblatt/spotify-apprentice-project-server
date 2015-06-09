Rails.application.routes.draw do
  api_version(module: 'V1',
              header: {
                name: 'Accept',
                value: 'application/vnd.spotify-apprentice-app.com; version=1'
              },
              defaults: { format: :json }) do
    resources :artists, only: :index
    resources :songs, only: :index
  end
end
