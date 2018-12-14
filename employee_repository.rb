class EmployeeRepository < BaseRepository

	def find_by_username(username)
		@array.find{|employee| employee.username == username}
	end

	def find_by_id(employee_id)
		@array.find{|employee| employee.id == employee_id.to_i}
	end
end 