# Problem 4, Ruby Problem Solving - Leap year
#
# David Little
# Oct 13 2020
#
# Wikipedia Leap Year Algorithm
# if (year is not divisible by 4) then (it is a common year)
# else if (year is not divisible by 100) then (it is a leap year)
# else if (year is not divisible by 400) then (it is a common year)
# else (it is a leap year)
#

def getYear(message)
  print message
  year = gets.chomp
  
  if year =~ /\A\d+\z/
    year = year.to_i
    message_common = "#{year} is a common year"
    message_leap = "#{year} is a leap year"

    if year % 4 != 0
      puts message_common
    elsif year % 100 != 0
      puts message_leap
    elsif year % 400 != 0
      puts message_common
    else
      puts message_leap
    end

  else
    puts "#{year} is not a valid year"
  end
end

getYear("Enter a year:")