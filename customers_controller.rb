require_relative "customer"
require_relative "customers_view"

class CustomersController
	
	def initialize(customer_repository)
		@customer_repository = customer_repository
		@customers_view = CustomersView.new
	end

	def list
		customers = @customer_repository.all
		@customers_view.display(customers)
	end

	def add
		name = @customers_view.ask_for(:name)
		adress = @customers_view.ask_for(:adress)
		customer = Customer.new(attributes = {name: name, adress: adress})
		@customer_repository.add(customer)
	end
end