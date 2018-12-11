class EmployeesView
	
	def display
		puts "\n---"
		CSV.foreach("employees.csv", {col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }) do |row|
			puts "#{row["id"]} - #{row["username"]} ; #{row["password"]} : #{row["role"]}"
		end
		puts "---"
	end

	def ask_user_for_name
		puts "What's your name ?"
		gets.chomp
	end

	def ask_user_for_password
		puts "Password ?"
		gets.chomp
	end

	def say_hello(username)
		puts "Welcome to you #{username} !"
	end
end