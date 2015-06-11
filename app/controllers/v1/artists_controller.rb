class V1::ArtistsController < ApplicationController
  def index
    artists = Artist.all.includes(:songs)

    render json: artists, include: [:songs]
  end
end
