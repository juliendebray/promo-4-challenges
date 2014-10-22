class EmployeesView
  def list_employees_to_user(employees)
    puts "Here are your employees:"
    employees.each_with_index do |employee, index|
      puts "#{index} - #{employee.name}, #{employee.status}"
    end
  end
end
