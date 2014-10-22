class EmployeesController

  def initialize
    @employees_repository = EmployeesRepository.new
    @employees_view = EmployeesView.new
  end

  def list_employees
    @employees_view.list_employees_to_user(@employees_repository.employees)
  end
end
