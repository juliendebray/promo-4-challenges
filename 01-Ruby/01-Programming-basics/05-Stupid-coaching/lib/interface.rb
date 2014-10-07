require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

puts "Say something to your coach !!"

your_message = gets.chomp

until coach_answer(your_message) == ""
  puts coach_answer_enhanced(your_message)
  your_message = gets.chomp
end
