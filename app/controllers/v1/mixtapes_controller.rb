class V1::MixtapesController < ApplicationController
  def show
    mixtape = Mixtape.new(params[:genre])

    render json: mixtape
  end
end
