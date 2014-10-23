require 'csv'

class CustomersRepository

  attr_reader :customers

  def initialize
    @csv_file = "repositories/customers.csv"
    @customers = []
    load_csv
  end

  def add_customer(new_customer)
    @customers << new_customer
    save_to_csv
  end


  private

  def load_csv
      return unless File.exist?(@csv_file)
      CSV.foreach(@csv_file) do |row|
        attributes = {
          name: row[0]
        }
        @customers << Customer.new(attributes[:name])
      end
    end

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      @customers.each do |customer|
        csv.puts([customer.name])
      end
    end
  end
end




