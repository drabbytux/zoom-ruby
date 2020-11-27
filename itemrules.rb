  # Item Override rules

    quality_rule_aged_brie = ->(item) {
      item.quality = (item.quality < 50) ? item.quality + quality_increment : item.quality
    } 

    quality_rule_sulfuras = ->(item) {
      item.quality = item.quality
    }
    sell_in_rule_sulfuras = ->(item) {
      item.sell_in = item.sell_in
    }

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

  # Add to hashes
    quality_rule_overrides = { aged_brie: quality_rule_aged_brie, sulfuras: quality_rule_sulfuras, backstage_passes: quality_rule_backstage_passes }
    sell_in_rule_overrides = { sulfuras: sell_in_rule_sulfuras }
