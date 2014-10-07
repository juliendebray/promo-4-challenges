require_relative "compute_name"

puts "First name?"

first_name = gets.chomp

puts "Middle name?"

middle_name = gets.chomp

puts "Last name?"

last_name = gets.chomp

print "Hello, #{compute_name(first_name, middle_name, last_name)}!!!"
# TODO: ask for the first name
# TODO: ask for the middle name
# TODO: ask for the last name
# TODO: Print a greeting to the user with the full name concatenated,
#       something like "Hello, Boris Paillard"

