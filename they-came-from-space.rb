
# - - - - - - - Organism base CLASS - - - - - - - #
class Organism

  attr_accessor :name, :hunger_level, :health_level, :energy_level
  attr_accessor :num_of_arms, :num_of_legs, :num_of_heads, :lifespan_in_years, :weight, :num_of_eyes, :general_color

  def initialize name
    @name = name
    @hunger_level=8   # 0= very hungry, 10= full of food!
    @health_level=10  # 0= dead, 10= perfect health!
    @energy_level=10  # 0= dead tired, 10= ready for anything!
  end

  # -- THINGS IT KNOWS
  def info
    puts "#{@name} is a #{self.class}."
    puts "- - - - - - - - - - - "
    puts "ENERGY LEVEL: #{energy_level}, HUNGER LEVEL: #{hunger_level}, HEALTH LEVEL: #{health_level}"
  end

  # -- THINGS IT DOES
  def eat
    puts "#{@name} eats."
    @hunger_level = @hunger_level + 5 > 10 ? 10 : @hunger_level + 5
    @energy_level = @energy_level + 2 > 10 ? 10 : @energy_level + 2
  end

  def fight
    puts "WAHMMMY! #{@name} defends his stuff!"
    @health_level = @health_level - 3
    @energy_level = @energy_level - 3
  end

  def sleep
    puts "#{@name} has a rest."
    @energy_level = 10
  end

end


# - - - - - - - Distinct organism CLASSES - - - - - - - #
class Flaneclop < Organism
  def initialize name
    super
    @num_of_arms = 0
    @num_of_legs = 4
    @num_of_heads = 2
    @lifespan_in_years = 25
    @weight = 14
    @num_of_eyes = 4
    @general_color = "green"
  end
end

class Jackunuss < Organism
  def initialize name
    super
    @num_of_arms = 2
    @num_of_legs = 3
    @num_of_heads = 2
    @lifespan_in_years = 144
    @weight = 88
    @num_of_eyes = 3
    @general_color = "pink"
  end
end

class PloopyPloop < Organism
  def initialize name
    super
    @num_of_arms = 2
    @num_of_legs = 2
    @num_of_heads = 4
    @lifespan_in_years = 65
    @weight = 245
    @num_of_eyes = 2
    @general_color = "brown"
  end
end

class Bombween < Organism
  def initialize name
    super
    @num_of_arms = 2
    @num_of_legs = 8
    @num_of_heads = 1
    @lifespan_in_years = 90
    @weight = 120
    @num_of_eyes = 4
    @general_color = "multiple"
  end
end

class Platteemooz < Organism
  def initialize name
    super
    @num_of_arms = 12
    @num_of_legs = 2
    @num_of_heads = 2
    @lifespan_in_years = 100
    @weight = 50
    @num_of_eyes = 6
    @general_color = "orange"
  end
end


# - - - - - - - ROCKET CLASS - - - - - - - #
class SpaceShip
  attr_accessor :passengers, :fuel_amount, :eta_destination
  Light_year_fuel_usage_amount = 10

  def initialize
    @fuel_amount = 100    # full tank of radio active fuel! All ready!
    @passengers = []
  end

  def board(*organism)
    organism.each {|o| @passengers << o }
  end

  def blast_off
    # initial fuel use
    self.consume_fuel
  end

  def consume_fuel
    puts "PPppppppchchcchchchchchcssssssssshhhhhhshshssh! Blast off!!!"
    @fuel_amount = @fuel_amount - Light_year_fuel_usage_amount
    puts "Fuel level remaing: #{fuel_amount} gigawatts"
  end

  def who_is_on_board
    print "All passengers: "
    @passengers.each {|p| print "#{p.name} "}
    print "\n"
  end

end


# _________________________________________ #

o1 = Flaneclop.new("Charlie")
o2 = Jackunuss.new("Karl")
o3 = PloopyPloop.new("*%sdk##askjk Jr.")
o4 = Bombween.new("Sally")
o5 = Platteemooz.new("R8")
ship = SpaceShip.new

o1.info
o1.eat
o1.fight
o1.fight
o1.info

ship.board(o1,o2,o3)
ship.blast_off
ship.who_is_on_board