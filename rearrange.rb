# Problem 2, Ruby Problem Solving
#
# David Little
# Oct 13 2020

def getNum(message)
  print message
  num = gets.chomp
  if num =~ /\A\-?\d+\z/
    return num  
  end
end


def rearrange(num)
  negative = (num.delete! '-') ? true : false
  if( negative )
    arr_number = num.split('').sort_by{|n| n[/\d+/].to_i}
    arr_zeros = arr_number.select{|n| n == '0'}
    arr_number.delete_if{|n| n == '0'}
    arr_zeros.each {| n | arr_number.insert(1, '0')}
  else
    arr_number = num.split('').sort_by{|n| n[/\d+/].to_i}.reverse
  end
  return negative ? '-' + arr_number.join('') : arr_number.join('');
end


# Input number
while !num = getNum("Enter number: ")
end
puts rearrange(num)