require "rails_helper"

describe "Food API" do
  context "PATCH /api/v1/foods/:id" do
    it "should update food if both name and calories are present" do
      food = create(:food)

      name = "new great food"
      calories = "10"

      json_payload = { "food": { "name" => "#{name}", "calories" => "#{calories}" } }

      patch "/api/v1/foods/#{food.id}", params: json_payload

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      updated_food = Food.find(food.id)

      expect(response).to have_http_status(200)
      expect(parsed_response).to have_key(:id)
      expect(parsed_response).to have_key(:name)
      expect(parsed_response).to have_key(:calories)

      expect(updated_food.name).to eq(name)
      expect(updated_food.calories).to eq(calories.to_i)
      expect(updated_food.id).to eq(food.id)
    end

    it "should return status 400 if food is not updated" do
      food = create(:food)

      name = "new great food"
      calories = "10"

      json_payload = { "food": { "name" => "#{name}" } }

      patch "/api/v1/foods/#{food.id}", params: json_payload

      not_updated_food = Food.find(food.id)

      expect(response).to have_http_status(400)
      expect(not_updated_food.name).to_not eq(name)
      expect(not_updated_food.calories).to_not eq(calories)
    end
  end
end
