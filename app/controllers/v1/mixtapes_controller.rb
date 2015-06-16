class V1::MixtapesController < ApplicationController
  def show
    mixtape = MixtapeGenerator.perform(genre_name: params[:genre])

    render json: mixtape, include: [:artist, :genre]
  end
end
