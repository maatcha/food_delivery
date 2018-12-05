require_relative "meal_repository"
require_relative "meals_controller"
require_relative "customer_repository"
require_relative "customers_controller"
require_relative "router"

meal_repository = MealRepository.new("meals.csv")
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new("customers.csv")
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller, employees_controller = nil, orders_controller = nil)
router.run
