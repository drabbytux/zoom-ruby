class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.quality = adjust_quality(item.increment)
      item.sell_in = adjust_sell_in(item.sell_in)
    end
  end

  def adjust_quantity(quality_increment)

  end

  def adjust_sell_in(sell_in_increment)

  end
end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end


