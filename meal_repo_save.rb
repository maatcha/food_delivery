require "csv"
require "pry"

class MealRepository

	def initialize(csv_file)
		@meals = []
		@csv_file = csv_file
		@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
		load_csv
	end

	def load_csv
		CSV.foreach(@csv_file, @csv_options) do |row|
			row["id"] = row["id"].to_i
			meal = Meal.new(
				id: row["id"], name: row["name"], price: row["price"])
			@meals << meal
		end
	end

	def add_meal(meal)
		meal.id = @meals.empty? ? 1 : @meals.last.id + 1
		@meals << meal
		write_csv
	end

	def write_csv
		CSV.open(@csv_file, "w") do |csv|
			csv << ["id", "name", "price"]
			@meals.each do |meal|
				csv << [meal.id, meal.name, meal.price]
			end
		end
	end
end