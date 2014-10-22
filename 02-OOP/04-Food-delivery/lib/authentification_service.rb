class AuthentificationService

  def login(username, password) #should return the user loged or nil
    repo = EmployeeRepository.new
    return repo.find_user_by_name(username)
  end

  def password(user, password)
    if user.password == password
      return user
    else
      return nil
    end
   end
end