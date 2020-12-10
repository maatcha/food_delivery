require_relative "base_view"

class OrdersView < BaseView

	def display_undelivered_orders(undelivered_orders)
		puts "\n---"
		undelivered_orders.each do |order|
		puts "#{order.id} : assigned to #{order.employee_name}"
		end
		puts "---"
	end

	def display_delivery_guy_s_undelivered_orders(orders_assigned)
		puts "\n---"
		orders_assigned.each do |order|
		puts "#{order.id} : #{order.meal} ; taken by #{order.customer_name} => #{order.customer_adress}"
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

	def display_meals(meals)
		puts "\n---"
		meals.each do |meal|
		puts "#{meal.id} - #{meal.name} : #{meal.price}"
		end
		puts "---"
	end	
end