require "csv"
require "pry"

class CustomerRepository
	
	def initialize(csv_file)
		@customers = []
		@csv_file = csv_file
		@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
		load_csv
	end

	def load_csv
		CSV.foreach(@csv_file, @csv_options) do |row|
			row["id"] = row["id"].to_i
			customer = Customer.new(
				id: row["id"], name: row["name"], price: row["price"])
			@customers << customer
		end
	end
	
	def add_customer(customer)
		customer.id = @customers.empty? ? 1 : @customers.last.id + 1
		@customers << customer
		write_csv
	end

	def write_csv
		CSV.open(@csv_file, "w") do |csv|
			csv << ["id", "name", "adress"]
			@customers.each do |customer|
				csv << [customer.id, customer.name, customer.adress]
			end
		end
	end
end