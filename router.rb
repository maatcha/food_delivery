class Router

	def initialize(meals_controller, customers_controller, employees_controller, orders_controller)
		@meals_controller = meals_controller
		@customers_controller = customers_controller
		@employees_controller = employees_controller
		@orders_controller = orders_controller
		@running = true
		@employee = nil
	end

	def run
		while @running
			@employee = @employees_controller.login
			while @employee
				if @employee.manager?
					print_managers_actions
					action = gets.chomp.to_i
					manager = @employee
					dispatch_manager_action(action, manager)
				else
					print_delivery_guys_actions
					action = gets.chomp.to_i
					delivery_guy = @employee
					dispatch_delivery_guy_action(action, delivery_guy)
				end
			end
			print `clear`
		end
	end

	private

	def print_delivery_guys_actions
		puts "\n---"
		puts "What're you gonna do ?"
		puts "1 - Display my undelivered orders"
		puts "2 - Sign out"
		puts "3 - Exit"
		puts "---"
	end
	
	def dispatch_delivery_guy_action(action, delivery_guy)
		case action
		when 1 then @orders_controller.list(delivery_guy)
		when 2 then @employee = nil
		when 3
			@employee = nil
			@running = false
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
		puts "6 - Display undelivered orders"
		puts "7 - Add a new order and assign it"
		puts "8 - Sign out"
		puts "9 - Exit"
		puts "---"
	end

	def dispatch_manager_action(action, manager)
		case action
		when 1 then @employees_controller.list
		when 2 then @meals_controller.list
		when 3 then @meals_controller.add
		when 4 then @customers_controller.list
		when 5 then @customers_controller.add
		when 6 then @orders_controller.list(manager)
		when 7 then @orders_controller.add_and_assign
		when 8 then @employee = nil
		when 9
			@employee = nil
			@running = false
		else
			puts "Hum, wrong action...try again !"
		end
	end
end