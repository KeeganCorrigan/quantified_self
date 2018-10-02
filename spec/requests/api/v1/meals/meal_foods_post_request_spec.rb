require "rails_helper"

describe "Meals API" do
  context "POST /api/v1/meals/:id/foods" do
    it "creates a new food associated with the meal if meal is found" do
      meal = create(:meal)
      food = create(:food)

      post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      parsed_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(parsed_json[:message]).to eq("Successfully added #{food.name} to #{meal.name}")
    end

    it "returns 404 if meal is not found" do
      food = create(:food)

      post "/api/v1/meals/4/foods/#{food.id}"

      expect(response).to have_http_status(404)
    end

    it "returns 404 if food is not found" do
      meal= create(:meal)

      post "/api/v1/meals/#{meal.id}/foods/5"

      expect(response).to have_http_status(404)
    end
  end
end
