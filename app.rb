require_relative "meal_repository"
require_relative "meal_controller"
require_relative "router"

meal_repository = MealRepository.new
meal_controller = MealController.new(meal_repository)



router = Router.new(meal_controller, employee_controller = nil, customer_controller = nil, order_controller = nil)
router.run
