#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'gilded_rose')

# Overriding Rules, GENERAL_RULE constant declared in gilded_rose.rb
rule_aged_brie = {quality_max: 50, variation: {quality: 1, sell_in: -1}} #aged brie gets better with age!
rule_sulfuras = {quality_max: nil, variation: {quality: 0,  sell_in: 0}}   #never sells, never changes
rule_backstage_passes  = {  #quality increases, with time intervals
  quality_max: 50,
  :variation => {:quality => 1, :sell_in => -1},
  :extra_rules => [
    {:quality => 2, :sell_in => 10},
    {:quality => 3, :sell_in => 5},
    {:quality => nil, :sell_in => 0 }
  ]
}
rule_conjured = {
  quality_max: 50,
  variation: {quality: -2, sell_in: -1},  #quality decrements twice as many!
  :extra_rules => [
    {:quality => -4, :sell_in => 0}
  ]
}
item_rule = ItemRule.new

puts "OMGHAI!"

items = [
  item_rule.addItem(Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)),
  item_rule.addItem(Item.new(name="Aged Brie", sell_in=2, quality=0), rule_aged_brie),
  item_rule.addItem(Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)),
  item_rule.addItem(Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80), rule_sulfuras),
  item_rule.addItem(Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80), rule_sulfuras),
  item_rule.addItem(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20), rule_backstage_passes),
  item_rule.addItem(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49), rule_backstage_passes),
  item_rule.addItem(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49), rule_backstage_passes),
  # This Conjured item does not work properly yet
  item_rule.addItem(Item.new(name="Conjured Mana Cake", sell_in=3, quality=6),rule_conjured) # <-- :O
]

days = 2
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items, item_rule
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each_with_index do |item, key|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
