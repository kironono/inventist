class ApiController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def render_status_400()
    render json: { error: '400 bad request'}, status: 400
  end

end
