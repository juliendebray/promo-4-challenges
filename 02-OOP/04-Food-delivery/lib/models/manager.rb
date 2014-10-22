require_relative 'employee'

class Manager < Employee
   def initialize (name, password)
    super(name, password, "manager")
  end
end
