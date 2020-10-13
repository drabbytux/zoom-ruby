# Problem 2, Ruby Problem Solving
#
# David Little
# Oct 13 2020


def getNum(message)
  print message
  num = gets.chomp
  if num =~ /\A\-?\d+\z/
    #Removed .to_i - Leave it as a string.
    return num  
  end
end

def rearrange(num)
  negative = (num.delete! '-') ? true : false
  arr_number = num.split('').sort_by { |n| n[/\d+/].to_i }.reverse
  return negative ? '-' + arr_number.join('') : arr_number.join('');
end


# Input number
while !num = getNum("Enter number: ")
end
puts rearrange(num)