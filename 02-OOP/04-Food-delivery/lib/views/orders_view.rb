class OrdersView
 def list_orders_to_user(orders)
    puts "Here are your orders:"
    orders.each_with_index do |order, index|
      puts "#{index} - #{order.delivered} - #{order.total_price}"
    end
  end

  def ask_user_to_compose_an_order
    puts "Splecify order to add:"
    meals = ask_sht("meals (use array)")
    total_price = ask_sht("total").to_f
    delivery_guy = ask_sht("delivery_guy id").to_i
    customer = ask_sht("customer id").to_i
    return [meals, total_price, delivery_guy, customer]
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