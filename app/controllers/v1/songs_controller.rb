class V1::SongsController < ApplicationController
  def index
    songs = Song.all
    render json: songs, include: [:artist]
  end

  def show
    song = Song.find(params[:id])
    render json: song, include: [:artist]
  end
end
