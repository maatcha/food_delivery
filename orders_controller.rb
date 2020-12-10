require "pry"
require_relative "order"
require_relative "orders_view"
require_relative "customer_repository"
require_relative "employee_repository"

class OrdersController

	def initialize(order_repository, customer_repository, employee_repository, meal_repository)
		@order_repository = order_repository
		@customer_repository = customer_repository
		@employee_repository = employee_repository
		@meal_repository = meal_repository
		@orders_view = OrdersView.new
	end

	def list(employee)
		undelivered_orders = @order_repository.find_by_deliverage
		orders_assigned = @order_repository.find_orders_assigned(undelivered_orders, employee)
		if @order_repository.am_i_a_delivery_guy?(employee)
			@orders_view.display_delivery_guy_s_undelivered_orders(orders_assigned)
		else
			@orders_view.display_undelivered_orders(undelivered_orders)
		end
	end

	def add_and_assign
		display_customers
		customer_id = @orders_view.ask_for(:customer_id)
		display_employees
		employee_id = @orders_view.ask_for(:employee_id)
		display_meals
		meal_id = @orders_view.ask_for(:meal_id)
		order = Order.new
		order.customer_name = @customer_repository.find_by_id(customer_id).name
		order.customer_adress = @customer_repository.find_by_id(customer_id).adress
		order.employee_name = @employee_repository.find_by_id(employee_id).username
		order.meal = @meal_repository.find_by_id(meal_id).name
		@order_repository.add(order)
	end

	def mark_as_delivered
		undelivered_orders = @order_repository.find_by_deliverage
		@orders_view.display_undelivered_orders(undelivered_orders)
		order_id = @orders_view.ask_for(:order_id)
		order_to_mark = @order_repository.find_by_id(order_id)
		order_to_mark.delivered!(order_to_mark)
		@order_repository.write_csv
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

	def display_meals
		meals = @meal_repository.all
		@orders_view.display_meals(meals)
	end
end