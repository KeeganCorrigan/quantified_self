require "rails_helper"

describe "Food API" do
  describe "GET api/v1/foods" do
    it "returns a list of all foods" do
      create_list(:food, 3)

      get "/api/v1/foods"

      foods = JSON.parse(response.body, symbolize_names: true)
      food = foods.first

      expect(response).to be_successful
      expect(foods.count).to eq(3)
      expect(food).to have_key(:id)
      expect(food).to have_key(:name)
      expect(food).to have_key(:calories)
    end
  end
end
