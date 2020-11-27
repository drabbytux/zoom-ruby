module ItemRules
  # Increment value Rules
    quality_increment_rule = ->(item) {
      quality_increment = (item.sell_in < 0) ? quality_increment * 2 : 1
    }
  
    sell_in_increment_rule = ->(item) {
      sell_in_increment = 1
    }
  
  # Main Quality value rules
    quality_rule = ->(item) {
      item.quality = (item.quality > 0) ? item.quality - quality_increment : item.quality
    }
  
  # Main Sell in rule
    sell_in_rule = ->(item) {
      item.sell_in = item.sell_in - sell_in_increment
    }
  
  # item specific override rule 1:"Aged Brie"
    quality_rule_aged_brie = ->(item) {
      item.quality = (item.quality < 50) ? item.quality + quality_increment : item.quality
    } 
  
  # item specific override rule 2: "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
    # quality rule overide
      quality_rule_sulfuras = ->(item) {
        item.quality = item.quality
      }
    # sell_in rule overide
      sell_in_rule_sulfuras = ->(item) {
        item.sell_in = item.sell_in
      }
  
  # item specific override rule 3: "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
    # quality rule override
      quality_rule_backstage_passes = ->(item) {
        if item.sell_in < 0
          item.quality = 0
        else
          if(item.sell_in <=10)
            quality_increment = (item.sell_in <=5) ? 3 : 2
          end
          item.quality = (item.quality < 50) ? item.quality + quality_increment : item.quality
        end
      }

  end


class GildedRose
  include ItemRules
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.quality = apply_quality_rules(item)
      item.sell_in = apply_sell_in_rules(item)
    end
  end

  def apply_quality_rules(item)

  end

  def apply_sell_in_rules(item)

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

