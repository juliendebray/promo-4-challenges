class EmployeesRepository

  attr_reader :employees

  def initialize
    @employees = [ DeliveryGuy.new("jean","jean"), DeliveryGuy.new("pierre", "pierre"), Manager.new("jul", "jul") ]
  end

  def find_user_by_name(username)
    return  @employees.bsearch {|employee| employee.name == username}
  end
end
