General_verse = %q(  NUMBER_BOTTLES_ON_WALL of beer on the wall,
  NUMBER_BOTTLES_ON_WALL of beer.
  Take one down and pass it around,
  NUMBER_BOTTLES_LEFT of beer on the wall.
  )
  
Last_verse = %q(  No more bottles of beer on the wall,
  no more bottles of beer. 
  Go to the store and buy some more,
  99 bottles of beer on the wall.
)

def pluralize(name, count)
  count == 1 ? name : "#{name}s"
end

def verse(number)
  str_verse = General_verse.gsub 'NUMBER_BOTTLES_ON_WALL', "#{number} #{pluralize("bottle", number)}"
  str_verse = str_verse.gsub 'NUMBER_BOTTLES_LEFT', "#{number-1} #{pluralize("bottle", number-1)}"
  return str_verse
end

number_of_bottles = 1
(number_of_bottles).downto(1) {|number| puts verse(number)}
puts Last_verse
