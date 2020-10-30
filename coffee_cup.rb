#Exist in their own .rb file
#Have at least 1 additional attribute
#Have at least 1 additional method.
#Overwrite at least 1 parent method.

require_relative "vessel"

class CoffeeCup < Vessel
  attr_accessor :colour

  def have_a_sip
    if @volume_filled != 0
      @contents = @contents - 1
      puts "Mmmmm good!"
    else
      puts "Empty cup! Filler up Joe!"
    end
  end
  
end