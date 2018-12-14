require_relative "meal"
require_relative "meals_view"

class MealsController

	def initialize(meal_repository)
		@meal_repository = meal_repository
		@meals_view = MealsView.new
	end

	def list
		meals = @meal_repository.all
		@meals_view.display(meals)
	end

	def add
		name = @meals_view.ask_for(:name)
		price = @meals_view.ask_for(:price)
		meal = Meal.new(attributes = {name: name, price: price})
		@meal_repository.add(meal)
	end
end