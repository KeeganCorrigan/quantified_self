require "rails_helper"

describe "Meal API" do
  context "GET /api/v1/meals" do
    it "returns a list of all meals and associated foods" do
      meal_1 = create(:meal)
      meal_2 = create(:meal)

      meal_1.foods.create(name: "snarfles", calories: 100)
      meal_1.foods.create(name: "burnpoppies", calories: 120)

      meal_2.foods.create(name: "babusakhies", calories: 150)

      get "/api/v1/meals"

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      meal = parsed_response.first

      expect(response).to have_http_status(200)
      expect(parsed_response.count).to eq(2)
      expect(meal).to have_key(:id)
      expect(meal).to have_key(:name)
      expect(meal).to have_key(:foods)
      expect(meal[:foods].count).to eq(2)
      expect(meal[:foods].first).to have_key(:id)
      expect(meal[:foods].first).to have_key(:calories)
      expect(meal[:foods].first).to have_key(:name)
    end

    it "returns an empty array if meal has no food associated" do
      meal = create(:meal)

      get "/api/v1/meals"

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response.first[:foods]).to eq([])
    end
  end
end
