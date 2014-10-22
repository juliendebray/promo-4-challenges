class OrdersController
  def initialize
    @orders_repository = OrdersRepository.new
    @orders_view = OrdersView.new
  end

  def list_orders
    @orders_view.list_orders_to_user(@orders_repository.orders)
  end

  def add_order
    new_order_tab = @orders_view.ask_user_to_compose_an_order
    new_order = Order.new(new_order_tab[0], new_order_tab[1], new_order_tab[2], new_order_tab[3])
    @orders_repository.add_order(new_order)
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