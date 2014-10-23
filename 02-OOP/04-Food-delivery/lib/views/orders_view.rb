class OrdersView
 def list_orders_to_user(orders)
    puts "Here are your orders:"
    orders.each_with_index do |order, index|
      puts "#{index} - #{order.delivered} - #{order.compute_total_price}"
    end
  end


  def ask_user_customer_id(customers)
    puts "Here are your customers:"
    customers.each_with_index do |customer, index|
     puts "#{index} - name: #{customer.name}"
    end
    return customer_id = ask_sht("customer id").to_i
  end

  def ask_user_to_compose_an_order(meals)
    puts "Here are the available meals:"
    meals.each_with_index do |meal, index|
      puts "#{index}. #{meal.name}: #{meal.price} euros"
    end
    ans = ask_sht("Specify order: (press enter to finish)").to_i
  end

  def ask_user_employee_id(employees)
    puts "Here are the employees - choose delivery_guy id"
    employees.each_with_index do |employee, index|
      puts "#{index} - #{employee.name}"
    end
    return employee_id = ask_sht("delivery_guy id").to_i
  end

  def print_confirmation(order)
    puts "order registred!"
    puts "customer: #{order.customer.name}"
    puts "to be delivered by #{order.delivery_guy.name}"
    puts "total price : #{order.compute_total_price}"
  end


  def ask_user_order_to_complete
    return ask_sht("Which order do you want to complete?").to_i
  end

  def ask_user_order_to_remove
    return ask_sht("Which order do you want to remove?").to_i
  end

  def ask_sht(request)
    puts request
    print ">"
    return gets.chomp
  end
end