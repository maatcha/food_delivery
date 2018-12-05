require_relative "meal"
require_relative "meals_view"

class MealsController

	def initialize(meal_repository)
		@meal_repository = meal_repository
		@meals_view = MealsView.new
	end

	def list
		@meals_view.display
	end

	def add
		name = @meals_view.ask_user_for_name
		price = @meals_view.ask_user_for_price
		meal = Meal.new(attributes = {name: name, price: price})
		@meal_repository.add_meal(meal)
	end
end