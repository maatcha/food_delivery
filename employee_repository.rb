class EmployeeRepository < BaseRepository

	def check_password(username, password)
		CSV.foreach(@csv_file, @csv_options) do |row|
			if username == row["username"] && password == row["password"]
				return row["role"]
			end
		end
	end
	# return "manager_logged_in"
	# return "delivery_guy_logged_in"
end 