class CustomersView

  def list_customers_to_user(customers)
    puts "Here are your customers:"
    customers.each_with_index do |customer, index|
      puts "#{index} - #{customer.name}"
    end
  end

  def ask_user_new_customer_attribute
    puts "What's new customer's name?" #Enrichir attribut en proposant un hash
    return gets.chomp.to_s
  end

end
