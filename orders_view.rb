require_relative "base_view"
require "pry"

class OrdersView < BaseView

	def display(undelivered_orders, employee)
		binding.pry
		puts "\n---"
		undelivered_orders.each do |order|
		puts "#{order.id} : assigned to #{order.employee_name}"
		end
		puts "---"
	end

	def display_customers(customers)
		puts "\n---"
		customers.each do |customer|
		puts "#{customer.id} - #{customer.name} : #{customer.adress}"
		end
		puts "---"
	end

	def display_employees(employees)
		puts "\n---"
		employees.each do |employee|
		puts "#{employee.id} - #{employee.username}"
		end
		puts "---"
	end
end