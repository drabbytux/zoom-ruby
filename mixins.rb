# Something you can drink
module ContainsConsumable
  def drink
    puts "You take a gulp."
  end
end


# People can get in it!
module HumanOccupancy
  humans_count = 0

  def enter
    puts "You get in!"
  end

  def exit
    "You get out!"
  end
end


module Sealable
  def addCover
    puts "You place a cover on."
  end

  def removeCover
    puts "You take the cover off."
  end
end