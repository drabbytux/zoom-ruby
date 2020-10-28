def customized_list_of_mulitples(multiples_of, size, &block)
  new_list = []
  list_sizes = size.times do |s|
    new_list << multiples_of * s
  end
  new_list = yield new_list if block_given?
  new_list
end

puts "Just the params"
puts customized_list_of_mulitples(10,5)
puts "With the block as well"
puts customized_list_of_mulitples(10,5){|new_list| new_list.map {|n| n * 2}}
puts "And again, with adjustments to the block"
puts customized_list_of_mulitples(10,5){|new_list| new_list.map {|n| n + 66 / 20 }}