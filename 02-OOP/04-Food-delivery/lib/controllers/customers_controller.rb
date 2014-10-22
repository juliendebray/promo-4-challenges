require_relative '../views/customers_view'
require_relative '../repositories/customers_repository'
require_relative '../models/customer'

class CustomersController

  def initialize
    @customers_repository = CustomersRepository.new
    @customers_view = CustomersView.new
  end

  def list_customers
    @customers_view.list_customers_to_user(@customers_repository.customers)
  end

  def add_customer
    customer_attributes = @customers_view.ask_user_new_customer_attribute
    new_customer = Customer.new(customer_attributes) #Only "name" requested for now
    @customers_repository.add_customer(new_customer)
  end

end


# Test element
# c = CustomersController.new
# c.add_customer
# c.list_customers