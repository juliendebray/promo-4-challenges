# Optional
require "date"

class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.now.strftime("%m/%d/%Y")
    @time = Time.now.strftime("%I:%M%p")
    @message
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.
    if @amount >= 0
      "+ #{@amount} euros on #{@date} at #{@time}"
    else
      "- #{@amount} euros on #{@date} at #{@time}"
    end
  end
end


