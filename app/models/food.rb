class Food < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :meal_foods
  has_many :meals, through: :meal_foods

  def self.favorites
    foods = joins(:meals).group("foods.id").having("COUNT(meal_foods.food_id) > 1").count

    times_eaten = order_food_by_times_eaten(foods)
    find_favorite_food_objects(times_eaten)
  end

  private

  def self.order_food_by_times_eaten(foods)
    foods.each_with_object({}) do |(key, value), acc|
      (acc[value]||=[]) << key
    end
  end

  def self.find_favorite_food_objects(foods)
    foods.each_with_object({}) do |(key, value), acc|
      acc[key] = Food.where(id: value)
    end
  end
end
