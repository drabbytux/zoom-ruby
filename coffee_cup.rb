#Exist in their own .rb file
#Have at least 1 additional attribute
#Have at least 1 additional method.
#Overwrite at least 1 parent method.

require_relative "vessel"

class CoffeeCup < Vessel
  attr_accessor :cup_colour

  def have_a_sip
    if @volume_filled != 0
      @contents = @contents - 1
      puts "Mmmmm good!"
    else
      puts "Empty cup! Filler up Joe!"
    end
  end

  def empty
    super
    puts "Oh well. It was good when it lasted! [places cup in sink]"
  end
  
end