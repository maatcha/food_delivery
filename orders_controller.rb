require_relative "order"
require_relative "orders_view"
require_relative "customer_repository"
require_relative "employee_repository"
require "pry"

class OrdersController

	def initialize(order_repository, customer_repository, employee_repository)
		@order_repository = order_repository
		@customer_repository = customer_repository
		@employee_repository = employee_repository
		@orders_view = OrdersView.new
	end

	def list(employee)
		undelivered_orders = @order_repository.find_by_deliverage
		@orders_view.display(undelivered_orders, employee)
	end

	def add_and_assign
		display_customers
		customer_id = @orders_view.ask_for(:customer_id)
		display_employees
		employee_id = @orders_view.ask_for(:employee_id)
		order = Order.new
		order.customer_name = @customer_repository.find_by_id(customer_id).name
		order.customer_adress = @customer_repository.find_by_id(customer_id).adress
		order.employee_name = @employee_repository.find_by_id(employee_id).username
		binding.pry
		@order_repository.add(order)
	end

	private

	def display_customers
		customers = @customer_repository.all
		@orders_view.display_customers(customers)
	end

	def display_employees
		employees = @employee_repository.all
		@orders_view.display_employees(employees)
	end
end