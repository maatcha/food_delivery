require "csv"

class BaseRepository
	attr_reader :id, :name, :adress, :price

	def initialize(csv_file, klass)
		@klass = klass
		@array = []
		@csv_file = csv_file
		@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
		load_csv
	end

	def load_csv
		CSV.foreach(@csv_file, @csv_options) do |row|
			row["id"] = row["id"].to_i
			if @klass == "Customer"
				meal_or_customer_or_employee = Customer.new(id: row["id"], name: row["name"], adress: row["adress"])
			elsif @klass == "Meal"
				meal_or_customer_or_employee = Meal.new(id: row["id"], name: row["name"], price: row["price"])
			else
				meal_or_customer_or_employee = Employee.new(id: row["id"], username: row["username"], password: row["password"], role: row["role"])
			end
			@array << meal_or_customer_or_employee
		end
	end
	
	def add(meal_or_customer)
		meal_or_customer.id = @array.empty? ? 1 : @array.last.id + 1
		@array << meal_or_customer
		write_csv
	end

	def write_csv
		CSV.open(@csv_file, "w") do |csv|
			@klass == "Customer" ? csv << ["id", "name", "adress"] : csv << ["id", "name", "price"]
			@array.each do |meal_or_customer|
				@klass == "Customer" ? csv << [meal_or_customer.id, meal_or_customer.name, meal_or_customer.adress]
				: csv << [meal_or_customer.id, meal_or_customer.name, meal_or_customer.price]
			end
		end
	end
end