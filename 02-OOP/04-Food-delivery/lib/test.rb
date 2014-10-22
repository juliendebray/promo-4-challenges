class EmployeesRepository

  attr_reader :employees

  def initialize
    @employees = [ DeliveryGuy.new("jean","jean"), DeliveryGuy.new("pierre", "pierre"), Manager.new("jul", "jul") ]
  end

  def find_user_by_name(username)
    tab = @employees.bsearch {|employee| employee.name == username}
    return tab
  end
end

class Employee

  attr_reader :name, :password, :status

  def initialize(name, password, status)
    @name = name
    @password = password
    @status = status
  end
end

# require_relative 'employee'

class Manager < Employee
   def initialize (name, password)
    super(name, password, "manager")
  end
end

class DeliveryGuy < Employee
   def initialize (name, password)
    super(name, password, "delivery_guy")
  end
end


test = EmployeesRepository.new
res = test.find_user_by_name("jul")
p res.status
p res.password
