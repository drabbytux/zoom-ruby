class Vessel

  attr_reader :volume_max, :material, :contents
  attr_accessor :volume_filled 

  def initialize(volume_max)
    @volume_max = volume_max
    @volume_filled = 0
    @contents = []
  end

  # - - Attribute writer/verifications 
  def volume_max=(amount)
    if amount < 0 || (amount.is_a? Integer)
      raise "Volume needs to be an integer of 0 or larger."
    end
    @volume = volume
  end

  def material=(material)
    if material == ""
      raise "A material name is required."
    end
    @material = material
  end


  # - - Three more methods
  def fill(content_name, amount)
    if (amount.is_a? Integer) && (amount > 0)

      puts "It's overflowing!" if (@volume_filled + amount > @volume_max ||  amount > @volume_max)
      @volume_filled = (@volume_filled + amount > @volume_max ||  amount > @volume_max) ? @volume_max : @volume_filled + amount

      #block calling
      if content_name.is_a? Array
        add_contents { content_name.each {|item|} }
      else
        if content_name != ""
          add_contents {content_name}
        end
      end
    else
      if( amount == "fill")
        @volume_filled = @volume_max
      else
        puts "No amount was specified."
      end
    end
  end

  def empty
    @volume_filled = 0
    @contents = nil
  end

  def move(position_moved_in_centimeters = 0)
    puts position_moved_in_centimeters > 0 ? "You carefully move it #{position_moved_in_centimeters} centimeters away." : "It didn't really move..."
    puts "It's quite full...Drip! Drip!..." if (@volume_filled >= @volume_max - 2)
  end

  private
    # Block example
    def add_contents
      item = yield
      @contents << item
      puts "Added #{item}"
  end

end
