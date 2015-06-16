class V1::MixtapesController < ApplicationController
  def show
    mixtape = MixtapeGenerator.perform(genre_name: params[:genre])

    render json: mixtape
  end
end
