require "rails_helper"

describe "Food API" do
  context "DELETE /api/v1/foods/:id" do
    it "deletes a food item" do
      food = create(:food)

      delete "/api/v1/foods/#{food.id}"

      expect(Food.count).to eq(0)
      expect(Food.find_by(id: food.id)).to eq(nil)
    end

    it "returns 404 if food item can not be found" do
      food = create(:food)

      delete "/api/v1/foods/4"

      expect(response).to have_http_status(404)
      expect(Food.count).to eq(1)
    end
  end
end
