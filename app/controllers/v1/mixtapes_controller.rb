class V1::MixtapesController < ApplicationController
  def show
    mixtape = MixtapeGenerator.perform(mixtape_params)

    render json: mixtape, include: [:artist, :genre]
  end

  private

  def mixtape_params
    { genre_name: params[:genre], time: params[:time].to_i }
  end
end
