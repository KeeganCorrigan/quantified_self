# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

meal_1 = Meal.create(name: "breakfast")
meal_2 = Meal.create(name: "dinner")
meal_3 = Meal.create(name: "lunch")
meal_4 = Meal.create(name: "snack")

food_1 = meal_1.foods.create(name: "Oreo", calories: 50)
food_2 = meal_1.foods.create(name: "Doritos", calories: 50)
food_3 = meal_1.foods.create(name: "Smores", calories: 60)
food_4 = Food.create(name: "PBR", calories: 140)

MealFood.create(meal: meal_2, food: food_1)
MealFood.create(meal: meal_2, food: food_2)
MealFood.create(meal: meal_2, food: food_3)
MealFood.create(meal: meal_3, food: food_2)
MealFood.create(meal: meal_3, food: food_1)
MealFood.create(meal: meal_4, food: food_4)
