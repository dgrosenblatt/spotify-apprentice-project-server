class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def per_page
    params[:per_page] || 10
  end

  def render_errors(model, status = :unprocessable_entity)
  render json: { errors: model.errors.full_messages },
         status: status
  end
end
