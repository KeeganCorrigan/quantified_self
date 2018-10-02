class Api::V1::FavoriteFoodsController < ApplicationController
  def index
    render json: FoodPresenter.favorites, each_serializer: FavoriteSerializer
  end
end
