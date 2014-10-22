require_relative 'controllers/restaurant_controller'

class Router
  def initialize
    @restaurant_controller = RestaurantController.new
    @authentification_service = AuthentificationService.new
    @customers_controller = CustomersController.new
    @employees_controller = EmployeesController.new
    @orders_controller = OrdersController.new
    @running = true
  end

  def run
    @restaurant_controller.print_welcome

    puts "------------------------------"
    puts "Please enter your username:"
    print ">"
    username = gets.chomp
    puts "Please enter your password:"
    print ">"
    password =  gets.chomp

    user = @authentification_service.login(username, password)
    if user.nil?
      puts "No username found"
    else
      user_logged = @authentification_service.password(user, password)
      if user_logged.nil?
        puts "Wrong password"
      else
        if user_logged.status == "manager"
          while @running
            display_tasks_manager
            action = gets.chomp.to_i
            print `clear`
            route_action_manager(action)
          end
        elsif user_logged.status == "delivery_guy"
          while @running
            display_tasks_delivery_guy
            action = gets.chomp.to_i
            print `clear`
            route_action_delivery_guy(action)
          end
        else
          puts "User status is not manager nor delivery_guy"
        end
      end
    end
  end

  def stop
    @running = false
  end

  private

  def route_action_manager(action)
    case action
    when 1 then @customers_controller.list_customers
    when 2 then @customers_controller.add_customer
    when 3 then @orders_controller.list_orders
    when 4 then @orders_controller.add_order
    when 5 then @orders_controller.remove_an_order
    when 6 then @employees_controller.list_employees
    when 7 then stop
    else puts "Please press 1 to 7"
    end
  end

  def display_tasks_manager
    puts ""
    puts "What would you like to do?"
    puts "Options:"
    puts "1. List customers"
    puts "2. Add customer"
    puts "3. View orders <customer_id>"
    puts "4. Add order <customer_id>, <employee_id_>"
    puts "5. Remove order <order_id>"
    puts "6. List employees"
    puts "7. Log out"
  end

  def route_action_delivery_guy(action)
    case action
    when 1 then @orders_controller.list_orders
    when 2 then @orders_controller.complete_an_order
    when 3 then stop
    else puts "Please press 1 to 3"
    end
  end

  def display_tasks_delivery_guy
    puts ""
    puts "What would you like to do?"
    puts "Options:"
    puts "1. View orders"
    puts "2. Complete order"
    puts "3. Log out"
  end
end