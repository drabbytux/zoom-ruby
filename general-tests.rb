# PROCS

my_proc = Proc.new{ |number| number * 5 }
array_1 = [1,2,3]
puts array_1.map(&my_proc)

# HASHES