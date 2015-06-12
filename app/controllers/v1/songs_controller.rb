class V1::SongsController < ApplicationController
  def index
    songs = Song.includes(:artist)
    paginate json: songs, include: [:artist], per_page: per_page
  end

  def show
    song = Song.find(params[:id])
    render json: song, include: [:artist]
  end
end
