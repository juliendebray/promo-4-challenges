require_relative "wagon_sort"

puts "Type a student name:"

students = []
name = gets.chomp

while name != ""
  students << name
  puts "Type another student name (or press enter to finish):"
  name = gets.chomp
end

puts "Congratulations! Your Wagon has #{students.size} students:"

print "- "

students_sorted = wagon_sort(students)

l = students_sorted.size
first_part = students_sorted[0..(l - 3)]
last_part = students_sorted[(l - 2)..(l - 1)]

first_part.each do |part|
  print "#{part}, "
end

puts "#{last_part[0]} and #{last_part[1]}"




# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.1.2/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.1.2/String.html#method-i-chomp



# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
