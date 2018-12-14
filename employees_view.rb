require_relative "base_view"

class EmployeesView < BaseView
	
	def display(employees)
		puts "\n---"
		employees.each do |employee|
		puts "#{employee.id} - #{employee.username}"
		end
		puts "---"
	end

	def logged_successfully(employee)
		if employee.manager?
			puts "[MANAGER] Welcome #{employee.username}!"
		else
			puts "[DELIVERY GUY] Welcome #{employee.username}!"
		end
	end

	def wrong_credentials
		puts "Wrong credentials... Try again !"
	end
end