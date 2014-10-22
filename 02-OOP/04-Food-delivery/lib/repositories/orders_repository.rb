class OrdersRepository
  attr_reader :orders

  def initialize
    @orders = []
  end

  def add_order(new_order)
    @orders << new_order
  end

  def complete_order(order_id)
    @orders[order_id].complete!
  end

  def remove_order(order_id)
    @orders.delete_at(order_id)
  end
end