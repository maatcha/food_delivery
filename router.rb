class Router

	def initialize(meals_controller, customers_controller, employees_controller, orders_controller)
		@meals_controller = meals_controller
		@customers_controller = customers_controller
		# @employees_controller = employees_controller
		# @orders_controller = orders_controller
	end

	def run
		loop do
			print_actions
			action = gets.chomp.to_i
			dispatch(action)
		end	
	end

	def print_actions
		puts "\n---"
		puts "What're you gonna do ?"
		puts "1 - Display meals"
		puts "2 - Add a new meals"
		puts "3 - Display customers"
		puts "4 - Add a new customer"
		puts "---"
	end

	def dispatch(action)
		case action
		when 1 then @meals_controller.list
		when 2 then @meals_controller.add
		when 3 then @customers_controller.list
		when 4 then @customers_controller.add
		else
			puts "Hum, wrong action...try again !"
		end
	end
end