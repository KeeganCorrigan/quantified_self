require "rails_helper"

describe "Meals API" do
  context "DELETE /api/v1/meals/:id/food/:id" do
    it "deletes a food associated with a meal" do
      meal = create(:meal)
      food = meal.foods.create(name: "Oreo", calories: 140)

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      parsed_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(parsed_json[:message]).to eq("Successfully removed #{food.name} to #{meal.name}")
      expect(Meal.count).to eq(1)
      expect(Food.count).to eq(1)
    end

    it "returns 404 if meal not found" do
      food = create(:food)

      delete "/api/v1/meals/4/foods/#{food.id}"

      expect(response).to have_http_status(404)
    end

    it "returns 404 if food not found" do
      meal = create(:meal)

      delete "/api/v1/meals/#{meal.id}/foods/5"

      expect(response).to have_http_status(404)
    end

    it "returns 404 if food is not associated with meal" do
      food = create(:food)
      meal = create(:meal)

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      expect(response).to have_http_status(404)
    end
  end
end
