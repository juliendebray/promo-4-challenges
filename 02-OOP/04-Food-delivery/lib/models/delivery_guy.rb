require_relative 'employee'

class DeliveryGuy < Employee
   def initialize (name, password)
    super(name, password, "delivery_guy")
  end
end