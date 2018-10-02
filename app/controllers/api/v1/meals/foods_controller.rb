class Api::V1::Meals::FoodsController < ApplicationController
  before_action :validate_meal, only: [:index]
  before_action :set_meal_food, only: [:create, :destroy]

  def index
    render json: Meal.includes(:foods).find_by(id: params[:meal_id])
  end

  def create
    if @food && @meal
      MealFood.create(meal: @meal, food: @food)
      render json: { message: "Successfully added #{@food.name} to #{@meal.name}"}, status: 201
    else
      render status: 404
    end
  end

  def destroy
    if @meal && @food && @meal.foods.include?(@food)
      @meal.foods.delete(@food)
      render json: { message: "Successfully removed #{@food.name} to #{@meal.name}"}, status: 201
    else
      render status: 404
    end
  end

  private

  def set_meal_food
    @food = Food.find_by(id: params[:id])
    @meal = Meal.find_by(id: params[:meal_id])
  end
end
