require_relative "repositories/employees_repository" #to delete if no test

class AuthentificationService

  def initialize
    @employees_repository = EmployeesRepository.new
  end

  def login(username)
    return @employees_repository.find_user_by_name(username)
  end

  def password(user, password)
    if user.password == password
      return user
    else
      return nil
    end
   end
end

# test = AuthentificationService.new
# user = test.login("jul")
# p user.name
# p user.password
# p test.password(user, "jul")