require "rails_helper"

describe "Food API" do
  describe "POST api/v1/foods" do
    it "can create a new food" do
      name = "big ol' bag of beans"
      calories = "400"
      payload = { "food": { "name": "#{name}", "calories": "#{calories}"} }.to_json

      post "/api/v1/foods", params: payload

      food = Food.last

      expect(food).to be_a(Food)
      expect(food.name).to eq(name)
      expect(food.calories).to eq(400)
    end

    it "returns status code 400 if food can not be created" do

    end
  end
end
