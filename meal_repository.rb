require "csv"

class MealRepository

	def initialize
		@csv_file = "meals.csv"
		@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, header_converters: :symbols, quote_char: "|" }
	end
	
	def add_meal(meal)
	end
end