
class OrdersController
  attr_reader :customers_repository, :orders_view
  def initialize #(meals_repository, customers_repository, employees_repository) # Pass repo as argument to controller
    @orders_repository = OrdersRepository.new
    @orders_view = OrdersView.new
    @meals_repository = MealsRepository.new
    @customers_repository = CustomersRepository.new
    @employees_repository = EmployeesRepository.new
  end

  def list_orders
    @orders_view.list_orders_to_user(@orders_repository.orders)
  end

  def add_order
    customer_id = @orders_view.ask_user_customer_id(@customers_repository.customers)
    meals_id = []
    answer = 1
    while answer > 0
      answer = @orders_view.ask_user_to_compose_an_order(@meals_repository.meals)
      meals_id << answer unless answer == 0
    end
    p meals_id
    meals = []
    meals_id.each { |index| meals << @meals_repository.meals[index] }
    employee_id = @orders_view.ask_user_employee_id(@employees_repository.employees)
    new_order = Order.new(meals, @employees_repository.employees[employee_id], @customers_repository.customers[customer_id])
    @orders_repository.add_order(new_order)
    @orders_view.print_confirmation(new_order)
  end

  def complete_an_order
    order_id = @orders_view.ask_user_order_to_complete
    @orders_repository.complete_order(order_id)
  end

  def remove_an_order
    order_id = @orders_view.ask_user_order_to_remove
    @orders_repository.remove_order(order_id)
  end
end