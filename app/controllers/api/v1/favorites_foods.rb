class Api::V1::FavoriteFoods < ApplicationController
  def index
    render json: Food.favorites, each_serializer: FavoriteFoods
  end
end
