require "rails_helper"

RSpec.describe Food, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
  end

  describe "relationships" do
    it { should have_many(:meal_foods) }
    it { should have_many(:meals).through(:meal_foods) }
  end

  describe "class methods" do
    describe ".favorites" do
      it "returns a list of the top three most eaten food and their associated eaten count" do
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

        expect(Food.favorites).to eq({ 2 =>[ food_3], 3=> [food_1, food_2] })
      end

      it "only returns items that have more than 1 eaten count" do
        meal_1 = create(:meal)
        meal_2 = create(:meal, name: "dinner")

        food_1 = meal_1.foods.create(name: "Oreo", calories: 50)
        food_2 = meal_1.foods.create(name: "Doritos", calories: 50)

        MealFood.create(meal: meal_2, food: food_1)

        expect(Food.favorites).to eq({ 2 => [food_1] })
      end
    end
  end
end
