require "csv"

class BaseRepository
	# attr_reader :array

	def initialize(csv_file, klass)
		@klass = klass
		array = []
		@array = array
		@csv_file = csv_file
		@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
		load_csv
	end

	def all
		@array
	end
	
	def add(meal_or_customer_or_order)
		meal_or_customer_or_order.id = @array.empty? ? 1 : @array.last.id + 1
		@array << meal_or_customer_or_order
		write_csv
	end

	private

	def load_csv
		CSV.foreach(@csv_file, @csv_options) do |row|
			row["id"] = row["id"].to_i
			if @klass == "Customer"
				meal_or_customer_or_employee_or_order = Customer.new(id: row["id"], name: row["name"], adress: row["adress"])
			elsif @klass == "Meal"
				meal_or_customer_or_employee_or_order = Meal.new(id: row["id"], name: row["name"], price: row["price"])
			elsif @klass == "Employee"
				meal_or_customer_or_employee_or_order = Employee.new(id: row["id"], username: row["username"], password: row["password"], role: row["role"])
			elsif @klass == "Order"
				row["delivered"] = row["delivered"] == "true"
				meal_or_customer_or_employee_or_order = Order.new(id: row["id"], meal: row["meal"], employee_name: row["employee name"], customer_name: row["customer name"], customer_adress: row["customer adress"], delivered: row["delivered"])
			end
			@array << meal_or_customer_or_employee_or_order
		end
	end

	def write_csv
		CSV.open(@csv_file, "w") do |csv|
			if @klass == "Customer"
				csv << ["id", "name", "adress"]
			elsif @klass == "Meal"
				csv << ["id", "name", "price"]
			else
				csv << ["id", "meal", "employee", "customer name", "customer adress", "delivered"]
				@array.each do |meal_or_customer_or_order|
					if @klass == "Customer"
						csv << [meal_or_customer_or_order.id, meal_or_customer_or_order.name, meal_or_customer_or_order.adress]
					elsif @klass == "Meal"
						csv << [meal_or_customer_or_order.id, meal_or_customer_or_order.name, meal_or_customer_or_order.price]
					else
						csv << [meal_or_customer_or_order.id, meal_or_customer_or_order.meal, meal_or_customer_or_order.employee_name, meal_or_customer_or_order.customer_name, meal_or_customer_or_order.customer_adress, meal_or_customer_or_order.delivered]
					end
				end
			end
		end
	end
end