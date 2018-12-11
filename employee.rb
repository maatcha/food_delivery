class Employee
	attr_accessor :id
	attr_reader :username, :password, :role

	def initialize(attributes = {})
		@id = attributes[:id]
		@name = attributes[:username]
		@password = attributes[:password]
		@role = attributes[:role]
	end
end