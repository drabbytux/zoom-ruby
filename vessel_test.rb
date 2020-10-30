require_relative "vessel"
require_relative "coffee_cup"
require_relative "bucket"
require_relative "swimming_pool"

# __________ VESSEL TESTS ___________ #

v = Vessel.new(10)
v.material = "glass"
test = ['coke', 'orange crush']
test2 = "water"
v.fill(test, 2)
v.fill(test2, 7)
v.move(2)
puts v.contents
v.empty