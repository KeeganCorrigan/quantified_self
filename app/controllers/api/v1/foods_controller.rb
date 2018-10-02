class Api::V1::FoodsController < ApplicationController
  before_action :validate_food, only: [:show]
  before_action :set_food, only: [:update, :destroy]

  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  end

  def create
    food = create_food(params)
    if food.save
      render json: food, status: 200
    else
      render status: 400
    end
  end

  def update
    if @food.update(name: params["food"]["name"], calories: params["food"]["calories"])
      render json: @food, status: 200
    else
      render status: 400
    end
  end

  def destroy
    if @food
      @food.destroy
    else
      render status: 404
    end
  end

  private

  def create_food(food_params)
    Food.new(
              name: food_params["food"]["name"],
              calories: food_params["food"]["calories"]
            )
  end

  def set_food
    @food = Food.find_by(id: params[:id])
  end
end
