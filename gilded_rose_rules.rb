module ItemRules
# Increment value Rules
  quantity_increment_rule = ->(item) {
      quality_increment = (item.sell_in < 0) ? quality_increment * 2 : 1
  }

  sell_in_increment_rule = ->(item) {
    sell_in_increment = 1
  }

# Main Quantity value rules
  quantity_rule = ->(item) {
    item.quality = (item.quality > 0) ? item.quality - quality_increment : item.quality
  }

# Main Sell in rule
  sell_in_rule = ->(item) {
    item.sell_in = item.sell_in - sell_in_increment
  }

# general rule 5: The Quality of an item is never more than 50
  # --

# item specific override rule 1: "Aged Brie" actually increases in Quality the older it gets
# with general rule 5: The Quality of an item is never more than 50
  item.quality = (item.quality < 50) ? item.quality + quality_increment : item.quality

# item specific override rule 2: "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
  # quantity rule overide
    item.quality = item.quality
  # sell_in rule overide
    item.sell_in = item.sell_in

# item specific override rule 3: "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
  # quality rule override
    if item.sell_in < 0
      item.quality = 0
    else
      if(item.sell_in <=10)
        quality_increment = (item.sell_in <=5) 3 : 2
      end
      item.quality = (item.quality < 50) ? item.quality + quality_increment : item.quality
    end


end

=begin





We have recently signed a supplier of conjured items. This requires an update to our system:

"Conjured" items degrade in Quality twice as fast as normal items


  Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Item.new(name="Aged Brie", sell_in=2, quality=0),
  Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  # This Conjured item does not work properly yet
  Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O


  OMGHAI!
-------- day 0 --------
name, sellIn, quality
+5 Dexterity Vest, 10, 20
Aged Brie, 2, 0
Elixir of the Mongoose, 5, 7
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 15, 20
Backstage passes to a TAFKAL80ETC concert, 10, 49
Backstage passes to a TAFKAL80ETC concert, 5, 49
Conjured Mana Cake, 3, 6

-------- day 1 --------
name, sellIn, quality
+5 Dexterity Vest, 9, 19
Aged Brie, 1, 1
Elixir of the Mongoose, 4, 6
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 14, 21
Backstage passes to a TAFKAL80ETC concert, 9, 50
Backstage passes to a TAFKAL80ETC concert, 4, 50
Conjured Mana Cake, 2, 4

=end
