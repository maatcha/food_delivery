require "pry"
class Order
	attr_accessor :id, :employee_name, :customer_name, :customer_adress, :meal, :delivered

	def initialize(attributes = {})
		@id = attributes[:id]
		@employee_name = attributes[:employee_name]
		@customer_name = attributes[:customer_name]
		@customer_adress = attributes[:customer_adress]
		@meal = attributes[:meal]
		@delivered = attributes[:delivered] || false
	end

	def delivered!(order_to_mark)
		order_to_mark.delivered = true
	end
end