class V1::ArtistsController < ApplicationController
  def index
    artists = Artist.includes(:songs)

    paginate json: artists, include: [:songs], per_page: per_page
  end

  def create
    artist = Artist.new(artist_params)

    if artist.save
      render json: artist, include: [:songs], status: 201
    else
      render_errors(artist)
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :description, :spotify_uri)
  end
end
