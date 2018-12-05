class CustomersView

	def display
		CSV.foreach("customers.csv", {col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }) do |row|
			puts "#{row["id"]} - #{row["name"]} : #{row["adress"]}"
		end
	end

	def ask_user_for_name
		puts "What's this customer'name ?"
		gets.chomp
	end

	def ask_user_for_adress
		puts "What's his adress ?"
		gets.chomp
	end
end