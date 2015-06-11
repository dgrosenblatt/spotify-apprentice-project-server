class V1::ArtistsController < ApplicationController
  def index
    artists = Artist.includes(:songs).decorate

    render json: artists, include: [:songs]
  end
end
