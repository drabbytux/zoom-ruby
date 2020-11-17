# Happy Birthday
#
# David Little
# Oct 14 2020

print "What's your name? "
name = gets.chomp
count = 1
while count <=4
  print "Happy birthday "
  if( count == 3 )
    print "dear #{name}"
  else
    print "to you"
    print count==4 ? '.':""
  end

  print "\n"
  count += 1
end
