class V1::SongsController < ApplicationController
  def index
    songs = Song.includes(:artist).decorate
    render json: songs, include: [:artist]
  end

  def show
    song = Song.find(params[:id]).decorate
    render json: song, include: [:artist]
  end
end
