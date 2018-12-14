require_relative "base_view"

class CustomersView < BaseView

	def display(customers)
		puts "\n---"
		customers.each do |customer|
		puts "#{customer.id} - #{customer.name} : #{customer.adress}"
		end
		puts "---"
	end
end