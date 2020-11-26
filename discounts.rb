class Checkout
  attr_accessor :bill

  def initialize(order, prices, discounts)
    @order = order
    @prices = prices
    @discounts = discounts
    @bill = Hash.new
    calculate_bill
  end

  def calculate_bill
    @order.each do |line_item_key, line_item_count|
      if @discounts.has_key?(line_item_key)
        @bill[line_item_key] = apply_discount(line_item_key, line_item_count, @discounts[line_item_key])
      else
        @bill[line_item_key] = line_item_count * @prices[line_item_key]
      end
    end
  end

  def apply_discount(line_item_key, line_item_count, line_item_discount)
    line_item_discount.call(@prices[line_item_key], line_item_count)
  end

  def whats_the_damage?
    tally=0
    @bill.each {|key, val| tally = tally+val}
    tally
  end
end

# Proc DISCOUNT definitions
discount_type_two_for_one = Proc.new { |price, item_total|
  total_price = (price * item_total) - ((item_total / 2) * price)
}
discount_type_two_or_more_20_percent_off = Proc.new { |price, item_total|
  item_total >= 2 ? (price * item_total) - ((price * item_total) * 0.2) : price * item_total
}

shop_discounts = {'grapes' => discount_type_two_for_one,'apples' => discount_type_two_or_more_20_percent_off }
prices = { 'grapes'=> 5, 'apples'=> 4, 'peaches'=> 7}

#  _ _ _ _ _ _ _ _ _ _ _ _#

order = [['grapes', 1], ['apples', 1], ['peaches',1]]
c = Checkout.new(order, prices, shop_discounts)
puts c.whats_the_damage?

=begin
 # eg. in ruby
 [ ['grapes', 1], ['apples', 0], ['peaches', 1] ] # output => 12
 [ ['grapes', 1], ['apples', 1], ['peaches', 1] ] # output => 15
 [ ['grapes', 2], ['apples', 2], ['peaches', 1] ] # output => 16.8
 [ ['grapes', 3], ['apples', 5], ['peaches', 2] ] # output => 36
 [ ['peaches', 7], ['grapes', 7], ['apples', 7] ] # output => 85.8
=end