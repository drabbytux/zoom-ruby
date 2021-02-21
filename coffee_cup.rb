require_relative "vessel"

class CoffeeCup < Vessel
  include ContainsConsumable
  attr_accessor :cup_colour

  def have_a_sip
    if @volume_filled != 0
      @volume_filled = @volume_filled - 2
      puts "Mmmmm good!"
    else
      puts "Empty cup! Filler up Joe!"
    end
  end

  def empty
    super
    puts "Oh well. It was good when it lasted! [places cup in sink] Back to work!!!"
  end
  
end
