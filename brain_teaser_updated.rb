# Jace P. Gold
# November 10th, 2017

# To Do
# Hint - Think about data types, convert from string to i or f

require 'pry'
require 'colorize'

@numbers = []

def calculate(type = 'highest')
  # Ternary operator to set greater than orless than operator
  # if type == 'highest'
  #   operator = :>
  # else
  #   operator = :<
  # end
  operator = type == 'highest' ? :> : :<

  # Setting the result to the first number in the array
  # We know we have to loop all elements in the array and check them
  # We don't assume 0 is the lowest. What if we have negative numbers?
  result = @numbers.first

  # 1 line loop
  # Long form
  # @numbers.each do |number|
  #   if type == 'highest'
  #     result = number if number > result
  #   else
  #     result = number if number < result
  #   end
  # end

  # Mid form
  # @numbers.each do |number|
  #   result = number if number.send(operator, result)
  # end
  # Look up send method if lost
  @numbers.each{ |number| result = number if number.send(operator, result)}

  # Output the highest number or lowest number
  puts "The #{type} number is #{result}".colorize(:light_blue)
end

def get_format

end

def get_numbers
  puts "What are your numbers?"
  puts "Example: 1  2  3  4  5  6  7  8  9  10"
  print '> '

  @user_numbers = $stdin.gets.strip
  @numbers = @user_numbers.split(' ').map(&:to_i) # map goes over all of the values in array
end

def menu
  puts "What would you like me to find for you?"
  puts "1. Highest Number"
  puts "2. Lowest Number"
  puts "3. Quit"
  print '> '
  choice = $stdin.gets.strip
  downchoice = choice.downcase
  if downchoice == '1' || downchoice.include?('hi')
    calculate
    menu
  elsif downchoice == '2' || downchoice.include?('low')
    calculate('Lowest')
    menu
  elsif downchoice == '3' || downchoice.include?('quit') || choice.include?('done')
    puts "Have a good day!".colorize(:red)
    exit(0)
  else
    puts 'Wrong choice. Please try again.'
    menu
  end
end

if ARGV.any?
  @numbers = get_format(ARGV.first)
  menu
else
  get_numbers
  menu
end
