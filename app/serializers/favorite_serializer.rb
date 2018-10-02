class FavoriteSerializer < ActiveModel::Serializer
  attributes :times_eaten, :foods

  def times_eaten
    object.times_eaten
  end

  def foods
    object.foods.map do |food|
      FavoriteFoodSerializer.new(food).attributes
    end
  end
end
