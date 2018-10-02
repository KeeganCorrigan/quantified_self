require "rails_helper"

describe "Food API" do
  describe "POST api/v1/foods" do
    it "can create a new food" do
      name = "big ol' bag of beans"
      calories = "400"
      payload = { "food": { "name": "#{name}", "calories": "#{calories}"} }

      post "/api/v1/foods", params: payload

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      food = Food.last

      expect(food).to be_a(Food)
      expect(food.name).to eq(name)
      expect(food.calories).to eq(400)

      expect(response).to have_http_status(200)
      expect(parsed_response[:calories]).to eq(calories.to_i)
      expect(parsed_response[:name]).to eq(name)
    end

    it "returns status code 400 if food can not be created" do
      name = "big ol' bag of beans"
      payload = { "food": { "name": "#{name}" }}

      post "/api/v1/foods", params: payload

      expect(Food.count).to eq(0)
      expect(response).to have_http_status(400)
    end
  end
end
