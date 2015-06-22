Rails.application.routes.draw do
  api_version(module: 'V1',
              header: {
                name: 'Accept',
                value: 'application/vnd.spotify-apprentice-app.com; version=1'
              },
              defaults: { format: :json }) do
    resources :artists, only: [:index, :create]
    resources :songs, only: [:index, :show]
    resource :mixtape, only: :show
  end
end
