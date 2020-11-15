# Problem 1, Ruby Problem Solving
#
# David Little
# Oct 9 2020


# getNum(message) prints the message, receives input and returns the number if one was entered, otherwise null is returned
def getNum(message)
  print message
  num = gets.chomp
  if num =~ /\A\d+\z/
    return num.to_i
  end
end


#Get the input 1
while !num1 = getNum("Enter number: ")
end

#Get the input 2
while !num2 = getNum("Enter another number: ")
end

print "Max:"
puts num1 > num2 ? num1 : num2