class Cart
  attr_accessor :bill

  def initialize(order, prices, discounts)
    @order = order
    @prices = prices
    @discounts = discounts
    @bill = Hash.new
    calculate_total
  end

  def calculate_total
    @order.each do |line_item_key, line_item_count|
      @bill[line_item_key] = @discounts.has_key?(line_item_key) ?
        apply_discount(line_item_key, line_item_count, @discounts[line_item_key]) :
        line_item_count * @prices[line_item_key]
    end
  end

  def apply_discount(line_item_key, line_item_count, line_item_discount)
    line_item_discount.call(@prices[line_item_key], line_item_count)
  end

  def whats_the_damage?
    @bill.reduce(0.0) {|sum, num| sum + num[1]}
  end
end


# Proc DISCOUNT definitions
discount_type_two_for_one = Proc.new { |price, item_total|
  total_price = (price * item_total) - ((item_total / 2) * price)
}
discount_type_two_or_more_20_percent_off = Proc.new { |price, item_total|
  item_total >= 2 ? (price * item_total) - ((price * item_total) * 0.2) : price * item_total
}

# Associate products with discounts
shop_discounts = {'grapes' => discount_type_two_for_one,'apples' => discount_type_two_or_more_20_percent_off }

# Shop Prices
prices = { 'grapes'=> 5, 'apples'=> 3, 'peaches'=> 7}


#  _______ TIME TO RUN _______#

order = [['peaches', 7], ['grapes', 7], ['apples', 7]]
c = Cart.new(order, prices, shop_discounts)
puts c.whats_the_damage?
