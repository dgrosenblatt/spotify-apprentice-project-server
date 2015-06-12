class V1::ArtistsController < ApplicationController
  def index
    artists = Artist.includes(:songs)

    paginate json: artists, include: [:songs], per_page: per_page
  end
end
