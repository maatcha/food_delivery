class CustomerRepository < BaseRepository

	def find_by_id(customer_id)
		@array.find{|customer| customer.id == customer_id.to_i}
	end
end