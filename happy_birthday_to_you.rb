# Happy Birthday
#
# David Little
# Oct 14 2020

print "What's your name?"
name = gets.chomp
count = 1
while count <=4
  print "Happy birthday "
  if( count == 3 )
    print "dear #{name}\n"
  else
    print "to you\n"
  end
  count += 1
end
