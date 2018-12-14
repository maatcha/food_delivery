require_relative "base_repository"
require_relative "order_repository"
require_relative "orders_controller"
require_relative "employee_repository"
require_relative "employees_controller"
require_relative "meal_repository"
require_relative "meals_controller"
require_relative "customer_repository"
require_relative "customers_controller"
require_relative "router"

meal_repository = MealRepository.new("meals.csv", "Meal")
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new("customers.csv", "Customer")
customers_controller = CustomersController.new(customer_repository)

employee_repository = EmployeeRepository.new("employees.csv", "Employee")
employees_controller = EmployeesController.new(employee_repository)

order_repository = OrderRepository.new("orders.csv", "Order")
orders_controller = OrdersController.new(order_repository, customer_repository, employee_repository)

router = Router.new(meals_controller, customers_controller, employees_controller, orders_controller)
router.run
