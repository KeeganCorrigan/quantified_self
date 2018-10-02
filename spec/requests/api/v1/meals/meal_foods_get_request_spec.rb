require "rails_helper"

describe "Meal API" do
  context "GET api/v1/meals/:id/foods" do
    it "returns the meal and a list of associated foods" do
      meal = create(:meal)
      food_1 = meal.foods.create(name: "Oreo", calories: 12)
      food_2 = meal.foods.create(name: "Smoreos", calories: 15)

      get "/api/v1/meals/#{meal.id}/foods"

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(parsed_response).to have_key(:id)
      expect(parsed_response).to have_key(:name)
      expect(parsed_response).to have_key(:foods)
      expect(parsed_response[:foods].count).to eq(2)
      expect(parsed_response[:foods].first).to have_key(:id)
      expect(parsed_response[:foods].first).to have_key(:name)
      expect(parsed_response[:foods].first).to have_key(:calories)
    end

    it "returns 404 if meal not found" do
      get "/api/v1/meals/3/foods"

      expect(response).to have_http_status(404)
    end
  end
end
