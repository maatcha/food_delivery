require_relative "meal_view"
require_relative "meal"

class MealController

	def initialize(meal_repository)
		@meal_repository = meal_repository
		@meal_view = MealView.new
	end

	def list
		@meal_view.display
	end

	def add
		name = @meal_view.ask_user_for_name
		price = @meal_view.ask_user_for_price
		meal = Meal.new(name, price)
		@meal_repository.add_meal(meal)
	end
end