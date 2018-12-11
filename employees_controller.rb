require_relative "employee"
require_relative "employees_view"

class EmployeesController

	def initialize(employee_repository)
		@employee_repository = employee_repository
		@employees_view = EmployeesView.new
	end

	def list
		@employees_view.display
	end

	def login
		username = @employees_view.ask_user_for_name
		password = @employees_view.ask_user_for_password
		check_password = @employee_repository.check_password(username, password)
		if check_password == "manager"
			return "manager"
		elsif check_password == "delivery_guy"
			return "delivery_guy"
		end
	end
end