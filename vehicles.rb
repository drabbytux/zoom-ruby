class Vehicle
  attr_accessor :odometer
  attr_accessor :gas_used

  def mileage
    @odometer / @gas_used
  end
  def accelerate
    puts "Floor it!"
  end

  def sound_horn
    puts "Beep! Beep!"
  end

  def steer
    puts "Turn front 2 wheels."
  end

end

class Car < Vehicle
end

class Truck < Vehicle
  attr_accessor :cargo

  def load_bed(contents)
    puts "Securing #{contents} in the truck bed."
    @cargo = contents
  end
end

class Motorcycle < Vehicle
  def steer
    puts "Turn front wheel."
  end
end

motorcycle = Motorcycle.new
motorcycle.steer
motorcycle.accelerate

truck = Truck.new
truck.accelerate
truck.steer
truck.load_bed("249 bouncy balls")
puts "The truck is carrying #{truck.cargo}."
truck.odometer = 11432
truck.gas_used = 366
puts "Average MPG:"
puts truck.mileage