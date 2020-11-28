class GildedRose
  def initialize(items)
    @items = items
    @quality_increment = 1
    @sell_in_increment = 1
    generate_rules
  end

  def update_quality()
    @items.each do |item|
      item.quality = apply_generic_quality_rules(item) if !quality_exemption? item
      item.sell_in = apply_generic_sell_in_rules(item) if !sell_in_exemption? item
    end
  end

  def apply_generic_quality_rules(item)
    @quality_increment  = @quality_increment_rule.(item)
    item.quality        = @quality_rule.(item)
  end

  def apply_generic_sell_in_rules(item)
    @sell_in_increment  = @sell_in_increment_rule.(item)
    item.sell_in        = @sell_in_rule.(item)
  end

  def quality_exemption?(item)
    override_rule?(item, 'quality_rules')
  end

  def sell_in_exemption?(item)
    override_rule?(item, 'sell_in_rules')
  end

  def override_rule?(item, rule_set)
    item_key = item.name.downcase.gsub(' ', '_') # Not good. Names are not good enough to rely on.
    if( @override_rules[rule_set.to_sym].has_key?(item_key.to_sym) )
      @override_rules[rule_set.to_sym][item_key.to_sym].call(item)
    end
  end
  
  def generate_rules
    #Lamdas need to be declared before being used, silly rabbit
    @quality_increment_rule = ->(item) {(item.sell_in.to_i < 0) ? 2 : 1}
    @sell_in_increment_rule = ->(item) {1}
    @quality_rule = ->(item) {(item.quality.to_i > 0) ? item.quality.to_i - @quality_increment : item.quality.to_i}
    @sell_in_rule = ->(item) {item.sell_in.to_i - @sell_in_increment}
    # Item Override rules
    quality_rule_aged_brie = ->(item) {item.quality = (item.quality < 50) ? item.quality.to_i + @quality_increment.to_i : item.quality} 
    quality_rule_sulfuras = ->(item) {item.quality = item.quality}
    sell_in_rule_sulfuras = ->(item) {item.sell_in = item.sell_in}
    quality_rule_backstage_passes = ->(item) {
      if item.sell_in < 0
        item.quality = 0
      else
        if(item.sell_in <=10)
          @quality_increment = (item.sell_in <=5) ? 3 : 2
        end
        (item.quality <= 50) ? item.quality + @quality_increment : item.quality
      end
    }

    # Add to hashes
    quality_rule_overrides = {aged_brie: quality_rule_aged_brie, sulfuras: quality_rule_sulfuras, backstage_passes: quality_rule_backstage_passes}
    sell_in_rule_overrides = {sulfuras: sell_in_rule_sulfuras}
    @override_rules = {quality_rules: quality_rule_overrides, sell_in_rules: sell_in_rule_overrides}
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

