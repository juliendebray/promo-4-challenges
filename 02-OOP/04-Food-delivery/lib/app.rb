# require models
require_relative "models/employee"
require_relative "models/manager"
require_relative "models/delivery_guy"
require_relative "models/customer"
require_relative "models/meal"
require_relative "models/order"
require_relative "models/restaurant"

# require repositories
require_relative "repositories/employees_repository"
require_relative "repositories/customers_repository"
require_relative "repositories/meals_repository"
require_relative "repositories/orders_repository"

# require controllers
require_relative "controllers/employees_controller"
require_relative "controllers/customers_controller"
require_relative "controllers/orders_controller"
require_relative "controllers/restaurant_controller"

# require view
require_relative "views/employees_view"
require_relative "views/customers_view"
require_relative "views/orders_view"
require_relative "views/restaurant_view"

#require authentification
require_relative "authentification_service"

#require router
require_relative "router"


router = Router.new
router.run

# # Employees instanciation

# employee1= Employee.new("Fab", "poiss", "manager")
# p employee1

# manager1 = Manager.new("julien", "mdp")
# p manager1.name
# p manager1.password
# p manager1.status