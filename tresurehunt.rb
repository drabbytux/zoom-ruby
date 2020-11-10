
class TresureMap
  attr_accessor :map
  MAP_SIZE = 8
  FOOD = "F"
  WATER = "W"
  TREASURE = "X"

  def initialize
    @map = Hash.new
    build_general_map
    populate_map_with_special_locations
  end

  def build_general_map
    scope_map {|x,y| @map[ [x,y] ] = '.' }
  end

  def populate_map_with_special_locations
    @map[ @map.keys.sample ] = FOOD
    @map[ @map.keys.sample ] = WATER
    @map[ @map.keys.sample ] = TREASURE
  end

  def to_s
    scope_map {|x,y|
      print @map[ [x,y] ]
      print "\n" if x == MAP_SIZE
    }
  end

  def scope_map
    MAP_SIZE.downto(-MAP_SIZE).each do |y|
      (-MAP_SIZE..MAP_SIZE).each do |x|
        yield(x,y)
      end
    end
  end

end


# ________TIME TO RUN ____________#

tm = TresureMap.new
puts tm

# -- TESTING -- #
# An empty map
tm.build_general_map
puts tm
