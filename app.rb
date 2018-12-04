require_relative "meal_repository"
require_relative "meal_controller"
require_relative "meal_router"

meal.repository = MealRepository.new
meal_controller = MealController.new(meal_repository)



router = Router.new(meal_controller, employee_controller, customer_controller, order_controller)
router.run
