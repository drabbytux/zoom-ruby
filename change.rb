# Cashmoney assignment
# David Little

Coins = {:tonnie => 200, :loonie => 100, :quarter => 25, :dime => 10, :nickle => 5}

def round_to_the_nickle(number)
  return number if number % 5 == 0
  last_digit = number.to_s.split("").pop.to_i
  number = number.floor(-1)

  if (last_digit.between?(3,7))
    number += 5
  elsif (last_digit.between?(8,9))
    number +=10
  end
  number
end


def getNum
  num = gets.chomp
  if num
    return num.to_f if num == 0
    if num =~ /\A(\d*\.?\d*)\z/
      return num.to_f
    end
  end
end

def pluralize(name, count)
  count > 1 ? "#{name}s" : name
end

# ---------- Begin processing ---------- #
amount = nil
while !amount do
  print "How much change do you need? "
  amount = getNum
end

amount_in_cents = round_to_the_nickle( (amount * 100).to_i )

total_coins = 0
actual_coins_needed = {}
str_return = ""
Coins.each do |coin_name, coin_value|
  number_of_coins = amount_in_cents / coin_value
  if (number_of_coins > 0)
    actual_coins_needed[coin_name] = number_of_coins
    amount_in_cents -= coin_value * number_of_coins
    total_coins += number_of_coins
  end
end

actual_coins_needed.each_with_index do |(coin_name, number_of_coins), i|
  str_return += (i < actual_coins_needed.size and i !=0 ) ? ", " : ""
  str_return += (i == actual_coins_needed.size-1) ? "and " : ""
  str_return += "#{number_of_coins} #{ pluralize(coin_name, number_of_coins)}"
end

puts "You need to dispense #{str_return}." if str_return
puts "You don't need any change dispensed" if total_coins == 0
puts "Total coins: #{total_coins}"
