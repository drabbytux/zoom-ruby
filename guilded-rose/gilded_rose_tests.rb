require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  # Rule constants for reuse
  Rule_event_passed  = {
    :variation => {:quality => 1, :sell_in => -1},
    :extra_rules => [
      {:quality => nil, :sell_in => 0 }
    ]
  }
  Rule_quality_max_normal_rules_with_accesnding_quality  = {
    quality_max: 50,
    :variation => {:quality => 2, :sell_in => -1}
  }

  Rule_time_interval_rules  = {
    quality_max: 50,
    :variation => {:quality => 1, :sell_in => -1},
    :extra_rules => [
      {:quality => 2, :sell_in => 10},
      {:quality => 3, :sell_in => 5},
      {:quality => nil, :sell_in => 0 }
    ]
  }

  # Start the tests!
  def test_foo
    item_rule = ItemRule.new
    items = item_rule.addItem([Item.new("fixme", 0, 0)])
    GildedRose.new(items, item_rule).update_quality()
    assert_equal items[0].name, "fixme"
  end

  def test_quantity_never_changes
    rule_no_variation = {quality_max: nil, variation: {quality: 0,  sell_in: 0}} 
    item_rule = ItemRule.new
    items = item_rule.addItem([Item.new("Nothing ever changes...", 10, 20)], rule_no_variation)
    GildedRose.new(items, item_rule).update_quality()
    assert_equal items[0].quality, 20
  end

  def test_sell_in_never_changes
    rule_no_variation = {quality_max: nil, variation: {quality: 0,  sell_in: 0}} 
    item_rule = ItemRule.new
    items = item_rule.addItem([Item.new("Nothing ever changes...", 10, 20)], rule_no_variation)
    GildedRose.new(items, item_rule).update_quality()
    assert_equal items[0].sell_in, 10
  end

  def test_no_quality_value_after_sell_in_date_passed
    item_rule = ItemRule.new
    items = item_rule.addItem([Item.new("Event was yesturday!", 0, 10)], Rule_event_passed)
    GildedRose.new(items, item_rule).update_quality()
    assert_equal items[0].quality, 0
  end

  def test_quality_will_not_go_over_max_quality
    item_rule = ItemRule.new
    items = item_rule.addItem([Item.new("max reached!", 10, 50)], Rule_quality_max_normal_rules_with_accesnding_quality)
    GildedRose.new(items, item_rule).update_quality()
    assert_equal items[0].quality, 50
  end

  def test_proper_quality_variation_reached_with_proper_time_interval_under_10
    item_rule = ItemRule.new
    items = item_rule.addItem([Item.new("Sell in days will be lower than 10 but higher than 5", 8, 20)], Rule_time_interval_rules)
    GildedRose.new(items, item_rule).update_quality() #Quality should raise by 2 instead of 1 as sell_in between 5...10
    assert_equal items[0].quality, 22
  end

  def test_proper_quality_variation_reached_with_proper_time_interval_under_5
    item_rule = ItemRule.new
    items = item_rule.addItem([Item.new("Sell in days will be lower 5 but higher than 0", 5, 20)], Rule_time_interval_rules)
    GildedRose.new(items, item_rule).update_quality() #Quality should raise by 3 instead of 1 as sell_in between 0...5
    assert_equal items[0].quality, 23
  end

end