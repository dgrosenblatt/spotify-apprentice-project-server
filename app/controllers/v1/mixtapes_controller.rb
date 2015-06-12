class V1::MixtapesController < ApplicationController
  def show
    mixtape = Mixtape.new(params)

    render json: mixtape
  end
end
