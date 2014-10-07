# This "require" line loads the contents of the 'date' file from the standard
# Ruby library, giving you access to the Date class.
require 'date'


def age_in_days(day, month, year)
  # TODO: return the age expressed in days given the day, month, and year of birth
  birthday = Date.new(year, month, day)
  date_now = DateTime.now
  age = date_now - birthday
  age.to_i
end

