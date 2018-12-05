class MealsView

	def display
		CSV.foreach("meals.csv", {col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }) do |row|
			puts "#{row["id"]} - #{row["name"]} : #{row["price"]}"
		end
	end

	def ask_user_for_name
		puts "Wich is that new meal's name ?"
		gets.chomp
	end

	def ask_user_for_price
		puts "Wich is that new meal's price ?"
		gets.chomp
	end
end