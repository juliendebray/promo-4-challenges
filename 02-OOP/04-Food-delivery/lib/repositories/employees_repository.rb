# require_relative '../models/employee' # to delete if no test
require 'csv'

class EmployeesRepository

  attr_reader :employees

  def initialize
    @csv_file = "repositories/employees.csv"
    @employees = []
    load_csv
  end

  def find_user_by_name(username)
    return  @employees.find {|employee| employee.name == username}
  end

  private

  def load_csv
    return unless File.exist?(@csv_file)
    CSV.foreach(@csv_file) do |row|
      attributes = {
        name: row[0],
        password: row[1],
        status: row[2]
      }
      @employees << Employee.new(attributes[:name], attributes[:password], attributes[:status])
    end
  end
end


# test = EmployeesRepository.new
# p test.employees[0].name
