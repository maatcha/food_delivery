require_relative "employee"
require_relative "employees_view"

class EmployeesController

	def initialize(employee_repository)
		@employee_repository = employee_repository
		@employees_view = EmployeesView.new
	end

	def list
		employees = @employee_repository.all
		@employees_view.display(employees)
	end

	def login
		username = @employees_view.ask_for(:username)
		password = @employees_view.ask_for(:password)
		employee = @employee_repository.find_by_username(username)
		if employee && employee.password == password
			@employees_view.logged_successfully(employee)
			return employee
		else
			@employees_view.wrong_credentials
			login
		end
	end
end