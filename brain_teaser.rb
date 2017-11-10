# Jace P. Gold
# November 10th, 2017

# To Do
# Hint - Think about data types, convert from string to i or f

require 'colorize'

@array = []
@lowest = 0
@highest = 0

def get_highest
  count = 0
  while count < @array.length
    puts @array[count]
    if @array[count] > @highest
      @highest = @array[count]
    else

    end
end

def get_lowest
  count = 0
  while count < @array.length
    puts @array[count]
    if @array[count] < @lowest
      @lowest = @array[count]
    else

    end
  end
end

def get_numbers
  puts "What are your numbers?"
  puts "Example: 1  2  3  4  5  6  7  8  9  10"
  print '> '

  @user_numbers = $stdin.gets.strip
  @array = @user_numbers.split(' ')
  count = 0
  while count < @array.length
    puts @array[count].to_f
  end

  binding.pry
end

def menu
  puts "What would you like me to find for you?"
  puts "1. Highest Number"
  puts "2. Lowest Number"
  puts "3. Quit"
  print '> '
  choice = $stdin.gets.strip.downcase
  if choice == '1' || choice.include?('hi')
    get_highest
    puts "The highest number is #{@highest}.".colorize(:light_blue)
  elsif choice == '2' || choice.include?('low')
    get_lowest
    puts "The lowest number is #{@lowest}.".colorize(:light_blue)
  elsif choice == '3' || choice.include?('quit') || choice.include?('done')
    puts "Have a good day!"
    exit(0)
  else
    puts 'Invalid user input. Please try again.'
    menu
  end
end

get_numbers
menu
