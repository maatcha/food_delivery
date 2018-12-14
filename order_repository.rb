require "pry"
class OrderRepository < BaseRepository

	def find_by_deliverage
		@array.select {|order| order.delivered == false}
	end
end