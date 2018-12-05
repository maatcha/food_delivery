class Meal
	attr_accessor :id
	attr_reader :name, :price

# meal = Meal.new(attributes = {:name => "fresh meet", :price => "10dollars"})

	def initialize(attributes = {})
		@id = attributes[:id]
		@name = attributes[:name]
		@price = attributes[:price]
	end
end