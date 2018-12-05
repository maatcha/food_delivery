class Customer
	attr_accessor :id
	attr_reader :name, :adress

	def initialize(attributes = {})
		@id = attributes[:id]
		@name = attributes[:name]
		@adress = attributes[:adress]
	end
end