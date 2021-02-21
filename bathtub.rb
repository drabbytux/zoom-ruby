require_relative "vessel"

class BathTub < Vessel
  
  include HumanOccupancy
  attr_accessor :accessable
  
  def run_bubble_bath
    self.fill(["warm water","bubble soap"], "fill")
    puts "Bath is ready! Ahhhhhhhhh!"
  end

  def empty
    super
    puts "All done! All that's left is suds and your rubber ducky!"
  end

end
