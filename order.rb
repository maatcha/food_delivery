class Order
	attr_accessor :id, :employee_name, :customer_name, :customer_adress, :meal
	attr_reader :delivered

	def initialize(attributes = {})
		@id = attributes[:id]
		@employee_name = attributes[:employee_name]
		@customer_name = attributes[:customer_name]
		@customer_adress = attributes[:customer_adress]
		@meal = attributes[:meal]
		@delivered = attributes[:delivered] || false
	end

	def delivered!
		delivered = true
	end
end