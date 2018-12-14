require_relative "base_view"

class MealsView < BaseView

	def display(meals)
		puts "\n---"
		meals.each do |meal|
		puts "#{meal.id} - #{meal.name} : #{meal.price}"
		end
		puts "---"
	end
end