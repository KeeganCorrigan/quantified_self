class FavoriteFoodSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send

  attributes :name, :calories, :mealsWhenEaten

  def name
    object.name
  end

  def calories
    object.calories
  end

  def mealsWhenEaten
    object.meals.pluck(:name)
  end
end
