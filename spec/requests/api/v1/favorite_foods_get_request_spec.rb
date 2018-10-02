require "rails_helper"

describe "Favorite foods API" do
  context "/api/v1/favorite_foods" do
    it "returns top three times eaten and the associated foods" do
      meal_1 = create(:meal)
      meal_2 = create(:meal, name: "dinner")
      meal_3 = create(:meal, name: "lunch")
      meal_4 = create(:meal, name: "snack")

      food_1 = meal_1.foods.create(name: "Oreo", calories: 50)
      food_2 = meal_1.foods.create(name: "Doritos", calories: 50)
      food_3 = meal_1.foods.create(name: "Smores", calories: 60)
      food_4 = create(:food)

      MealFood.create(meal: meal_2, food: food_1)
      MealFood.create(meal: meal_2, food: food_2)
      MealFood.create(meal: meal_2, food: food_3)

      MealFood.create(meal: meal_3, food: food_2)
      MealFood.create(meal: meal_3, food: food_1)

      MealFood.create(meal: meal_4, food: food_4)

      get "/api/v1/favorite_foods"

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      most_eaten = parsed_response.first
      food = most_eaten[:foods].first

      expect(response).to have_http_status(200)
      expect(parsed_response.count).to eq(2)

      expect(most_eaten).to have_key(:times_eaten)
      expect(most_eaten).to have_key(:foods)

      expect(food).to have_key(:name)
      expect(food).to have_key(:calories)
      expect(food).to have_key(:mealsWhenEaten)
      expect(food[:mealsWhenEaten]).to be_a(Array)
      expect(food[:mealsWhenEaten].count).to eq(3)
    end
  end
end
