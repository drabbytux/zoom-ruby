def call_block(&block)
  puts 1
  block.call_block
  puts 3
end

def call_twice
  puts 1
  yield
  yield
  puts 3
end

def pass_parametres_to_block
  puts 1
  yield 9, 3
  puts 3
end


pass_parametres_to_block { |first, second| puts "OK - here are #{first} and #{second}" }

call_twice {}