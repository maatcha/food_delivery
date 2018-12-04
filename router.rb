class Router

	def initialize(meal_controller, employee_controller, customer_controller, order_controller)
		@meal_controller = meal_controller
		@employee_controller = employee_controller
		@customer_controller = customer_controller
		@order_controller = order_controller
	end

	def run
	end

	def print_actions
	end

	def dispatch(action)
		case action
		when 1 then @meal_controller.list
		when 2 then @meal_controller.add
		else
			puts "Hum, wrong action...try again !"
	end
end