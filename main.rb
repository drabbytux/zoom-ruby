require_relative "vessel"
require_relative "coffee_cup"
require_relative "bathtub"
require_relative "swimming_pool"

# _____________________ #

# Superclass Vessel TESTS
puts "Vessel test ------------------------ "
v = Vessel.new(10)
v.material = "glass"
test = ['coke', 'orange crush']
test2 = "water"
v.fill(test, 2)
v.fill(test2, 7)
v.move(2)
puts v.contents
v.empty


# Subclass Bathtub TESTS
puts "Bathtub test ------------------------ "
b = BathTub.new(1000)
b.run_bubble_bath
b.empty
# New method
b.enter


# Subclass CoffeeCup TESTS
puts "CoffeeCup test ------------------------ "
c = CoffeeCup.new(20)
c.fill("Coffee", "fill")
c.have_a_sip
# New method
c.drink
c.empty

# Subclass SwimmingPool TESTS
puts "SwimmpingPool test ------------------------ "
s = SwimmingPool.new(200000)
s.clean_pool
s.move(30)
# New method
s.addCover
