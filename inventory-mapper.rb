UNIT_PART_LIST = { 
  Shelf:  {a: 1},
  Stool: {b: 1, c: 3},
  Table:  {d: 1, e: 4}
}

class UnitMapper
  attr_accessor :part_id_list, :unit_list_that_can_be_made

  def initialize
    @unit_list_that_can_be_made = {}
  end

  def get_part_list_for_unit(unit_name)
    UNIT_PART_LIST[unit_name.to_sym]
  end

  def what_units_can_we_make?(part_id_list)
    @part_id_list = part_id_list

    UNIT_PART_LIST.each do |unit_name, unit_parts|
      can_we_make_this_unit = true
      number_of_units_that_can_be_made = nil
      get_part_list_for_unit(unit_name).each do |part_id, number_of_parts|
        if( part_id_list.include? part_id )
          if(part_id_list[part_id] >= number_of_parts)
            if( number_of_units_that_can_be_made != nil )
              number_of_units_that_can_be_made = (number_of_units_that_can_be_made <= part_id_list[part_id] / number_of_parts ) ? number_of_units_that_can_be_made : part_id_list[part_id] / number_of_parts 
            else
              number_of_units_that_can_be_made = part_id_list[part_id] / number_of_parts 
            end
          else
            can_we_make_this_unit = false
          end
        else
          can_we_make_this_unit = false
        end
      end

      if can_we_make_this_unit
        remove_part_inventory_from_list(unit_name, number_of_units_that_can_be_made)
        unit_list_that_can_be_made[unit_name.to_s] = number_of_units_that_can_be_made
      else
        unit_list_that_can_be_made[unit_name] = 0
      end
    end
    unit_list_that_can_be_made
  end


  def remove_part_inventory_from_list(unit_name, number_to_remove)
    get_part_list_for_unit(unit_name).each do |part_id, number_of_parts|
      @part_id_list[part_id] = @part_id_list[part_id] - (number_of_parts * number_to_remove)
    end
  end
end


class InventoryHelper
    attr_accessor :part_id_string, :part_id_list

    def initialize(part_string = nil)
      @part_id_string = part_string ? part_string : 'aabbbccceeeedddd' #'abccc' # For testing
      create_part_list
      @um = UnitMapper.new
    end

    def start_helper
      puts "Starting..."
      puts "*** Generating Unit count from parts ***"
      puts @um.what_units_can_we_make? @part_id_list
    end

    def create_part_list
      @part_id_list = @part_id_string.each_char
        .with_object(Hash.new(0)) {|c, m| m[c.to_sym]+=1}
    end
end


# ______________________________ #

ihelper = InventoryHelper.new('accceeeedddd')
ihelper.start_helper