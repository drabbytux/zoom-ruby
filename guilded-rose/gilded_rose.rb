GENERAL_RULE = {
  quality_max: 50,
  variation: {quality: -1, sell_in: -1},
  :extra_rules => [
    {:quality => -2, :sell_in => 0}
  ]
}

class GildedRose
  def initialize(items, item_rules = GENERAL_RULE )
    @items = items
    @rules = item_rules
  end

  def update_quality()
    @items.each do |item|
      item.quality = get_quality_value(item)
      item.sell_in = get_sell_in_rules(item)
    end
  end

  def get_quality_value(item)
    @rules.adjust_quality_value(item, @rules.getRule( @items.find_index(item)))
  end

  def get_sell_in_rules(item)
    @rules.adjust_sell_in_value(item, @rules.getRule( @items.find_index(item)))
  end

end


class ItemRule
  attr_accessor :items
  def initialize()
    @items = {}
  end

  def addItem(item, rule = GENERAL_RULE)
    @items[item] = rule
    item
  end

  def getRule(key)
    @items.values[key]
  end

  def adjust_quality_value(item, rules)
    if(rules[:extra_rules])
      val = process_extra_rules(item, rules)
      (rules[:quality_max])? [val, rules[:quality_max]].min : val
    else
      val = rules[:variation][:quality]? item.quality + rules[:variation][:quality] : item.quality
      (rules[:quality_max])? [val, rules[:quality_max]].min : val
    end
  end

  def adjust_sell_in_value(item, rules)
    rules[:variation][:sell_in]? item.sell_in + rules[:variation][:sell_in] : item.sell_in
  end

  def process_extra_rules(item, rules)
    val = item.quality + rules[:variation][:quality]
    rules[:extra_rules].each do |rule|
      if (item.sell_in <= rule[:sell_in])
        if( rule[:quality] )
          val = rule[:quality] + item.quality
        else
          val = 0
        end
      end
    end
    val
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
