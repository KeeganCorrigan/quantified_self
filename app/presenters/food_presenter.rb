class FoodPresenter
  def self.favorites
    Food.favorites.map do |count, food|
      FavoriteFood.new(count, food)
    end
  end
end
