class ApplicationController < ActionController::API
  def validate_food
    unless Food.find_by(id: params[:id])
      render status: 400
    end
  end

  def validate_meal
    unless Meal.find_by(id: params[:meal_id])
      render status: 404
    end
  end
end
