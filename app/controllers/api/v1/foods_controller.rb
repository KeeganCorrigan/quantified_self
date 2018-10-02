class Api::V1::FoodsController < ApplicationController
  before_action :validate_food, only: [:show]

  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  end
end
