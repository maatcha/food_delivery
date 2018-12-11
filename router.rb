class Router

	def initialize(meals_controller, customers_controller, employees_controller, orders_controller)
		@meals_controller = meals_controller
		@customers_controller = customers_controller
		@employees_controller = employees_controller
		# @orders_controller = orders_controller
	end

	def run(employee_role)
		if employee_role == "manager"
			puts "\nWelcome, #{employee_role} !"
			loop do
				print_managers_actions
				action = gets.chomp.to_i
				dispatch_manager_action(action)
			end
		elsif employee_role == "delivery_guy"
			puts "\nWelcome, #{employee_role} !"
			loop do
				print_delivery_guys_actions
				action = gets.chomp.to_i
				dispatch_delivery_guy_action(action)
			end
		else
			puts "Wrong id or password...please type them again."
		end
	end

	def login
		puts "\n---"
		@employees_controller.login
	end

	def print_delivery_guys_actions
		puts "\n---"
		puts "What're you gonna do ?"
		puts "1 - Display employees"
		puts "---"
	end
	
	def dispatch_delivery_guy_action(action)
		case action
		when 1 then @employees_controller.list
		else
			puts "Hum, wrong action...try again !"
		end
	end

	def print_managers_actions
		puts "\n---"
		puts "What're you gonna do ?"
		puts "1 - Display employees"
		puts "2 - Display meals"
		puts "3 - Add a new meals"
		puts "4 - Display customers"
		puts "5 - Add a new customer"
		puts "---"
	end

	def dispatch_manager_action(action)
		case action
		when 1 then @employees_controller.list
		when 2 then @meals_controller.list
		when 3 then @meals_controller.add
		when 4 then @customers_controller.list
		when 5 then @customers_controller.add
		else
			puts "Hum, wrong action...try again !"
		end
	end
end