# Happy Birthday
#
# David Little
# Oct 14 2020

print "What's your name? "
name = gets.chomp
count = 1
str_out = ""

until count > 4
  str_out += "Happy birthday "

  case count
  when 3
    str_out += "dear #{name}"
  else
    str_out += "to you"
    str_out += count==4 ? '.':""
  end

  str_out += "\n"
  count += 1
end

puts str_out