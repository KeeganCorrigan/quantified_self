class Api::V1::Meals::FoodsController < ApplicationController
  before_action :validate_meal, only: [:index]

  def index
    render json: Meal.includes(:foods).find_by(id: params[:meal_id])
  end
end
