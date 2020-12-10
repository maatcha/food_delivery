class OrderRepository < BaseRepository

	def initialize(csv_file, klass, employee_repository)
		@employee_repository = employee_repository		
		@klass = klass
		array = []
		@array = array
		@csv_file = csv_file
		@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
		load_csv
	end

	def find_by_deliverage
		@array.select {|order| order.delivered == false}
	end

	def find_by_id(order_id)
		@array.find {|order| order.id == order_id.to_i}
	end

	def find_orders_assigned(undelivered_orders, employee)
		undelivered_orders.select {|undelivered_order| undelivered_order.employee_name == employee.username}
	end

	def am_i_a_delivery_guy?(employee)
		employee.role == "delivery_guy"
	end

end