class CustomersRepository

  attr_reader :customers

  def initialize # How to initialize it??
    @customers = []
  end

  def add_customer(new_customer)
    @customers << new_customer
  end
end