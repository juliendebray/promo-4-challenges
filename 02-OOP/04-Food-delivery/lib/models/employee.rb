class Employee

  attr_reader :name, :password, :status

  def initialize(name, password, status)
    @name = name
    @password = password
    @status = status
  end
end
