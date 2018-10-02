class ApplicationController < ActionController::API
  def validate_food
    unless Food.find_by(id: params[:id])
      render json: {message: "No food with that ID"}, status: 400
    end
  end
end
