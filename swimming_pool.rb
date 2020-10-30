require_relative "vessel"

class SwimmingPool < Vessel

  attr_accessor :filter_system_status

  def initialize(volume_max)
    super
    @filter_system_status = "off"
  end

  def clean_pool
    @filter_system = "on"
    puts "Filter system is now #{filter_system_status} scooping the leaves from the bottom and adding some chlorine!"
  end

  def move(position_moved_in_centimeters = 0)
    puts "Sorry! You'll have to hire a team of engineers to move a swimming pool! :)"
  end

end

s = SwimmingPool.new(200000)
