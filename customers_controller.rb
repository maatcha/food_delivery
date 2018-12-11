require_relative "customer"
require_relative "customers_view"

class CustomersController
	
	def initialize(customer_repository)
		@customer_repository = customer_repository
		@customers_view = CustomersView.new
	end

	def list
		@customers_view.display
	end

	def add
		name = @customers_view.ask_user_for_name
		adress = @customers_view.ask_user_for_adress
		customer = Customer.new(attributes = {name: name, adress: adress})
		@customer_repository.add(customer)
	end
end