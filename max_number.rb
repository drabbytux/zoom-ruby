# Problem 1, Ruby Problem Solving
#
# David Little
# Oct 9 2020

=begin
Enter a number: 3
Enter another number: 1
Max: 3
=end

# Get the input
print "Enter a number"
num1 = gets.chomp
if num1.is_a? Numeric 
  puts "OK it's an int!"
end