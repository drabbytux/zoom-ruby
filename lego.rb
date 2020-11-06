# Class LegoHat encompasses the attributes and actions needed for a Hat Object 
class LegoHat

  attr_accessor :size, :colour, :style

  # initialize takes in the size, colour and style of a hat and initilizes their attributes.
  # I would expect the size to be a string(ie: size: medium) or possibly integer (ie size: 4), colour and style both strings.
  # Limits and exceptional/error cases : the size should have a test case as an integer if that is what is expected.
  def initialize(size, colour, style)
    @size = size
    @colour = colour
    @style = style
  end

  # to_s method sends back the colour and style of the hat. Unfortunelty, as it's written here, it attempts to use an uninitialized/defined "size_word" attribute/function call. Also, the colour should utilize the at(@) symbol to focus on object's colour attribute
  def to_s
    "a #{size_word} #{colour} #{@style}"
  end
end

# Class Legoitem encompasses the attributes and actions needed for a variety of lego items that vary in size and weight. 
class LegoItem

  attr_accessor :name, :weight

  # initialize takes in a name and weight of a lego item and initializes both those attributes
  # name should be string and weight should be an integer as other functions compare themselves to an int value
  # NOTES on limits and exceptional/error cases: the weight attribute should have an integer check done
  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # to_s returns the object's weight and name to the caller.
  def to_s
    "a #{@weight} gram #{@name}"
  end

  # is_heavy takes in a threshold parameter and returns a boolean value if the weight is heavier than the threshold. True if the weight is heavier.
  # Threshold should be an integer as it's compared to an integer attribute
  def is_heavy(threshold)
    @weight > threshold
  end
end

# Class LegoMinifigure encompasses the attributes and actions needed for a complete lego figure, with a name, hat, and two places for items to attach to.
class LegoMinifigure

  attr_accessor :name, :hat, :left_item, :right_item

  # initialize takes in a needed parameter name, and optional parameters for hat, left_item and right_item and initializes each
  # name is a string, hat a LegoHat object, left_item/right_items should be LegoItem objects.
  # NOTES on limits and exceptional/error cases: (just to note: if the to_s methods were not used, these would have to verifiy the object types before initializing them)
  def initialize(name, hat = nil, left_item = nil, right_item = nil)
    @name = name
    @hat = hat
    @left_item = left_item
    @right_item = right_item
  end

  # to_s returns a string of the available name attribute, and hat,left_item and right_item using functions to output the correct string information (hat_words, left_item_words, and right_item_words)
  def to_s
    "A Lego minifigure named #{@name}#{hat_words}#{left_item_words}#{right_item_words}."
  end

  # hat_words returns a string with the hat attribute if it one is defined
  def hat_words
    if @hat
      ", who is wearing #{@hat}"
    else
      ""
    end
  end

  # left_item_words returns a string (if left_item is not nil)
  def left_item_words
    if @left_item
      if @hat == nil
        item_connector = ", who is holding"
      else
        item_connector = " and is holding"
      end
      "#{item_connector} #{@left_item} in the left hand"
    else
      ""
    end
  end

  # right_item_words returns a string (if right_item is not nil)
  def right_item_words
    if @right_item
      if @hat == nil and @left_item == nil
        item_connector = ", who is holding"
      elsif @left_item == nil
        item_connector = " and is holding"
      else
        item_connector = " and "
      end
      "#{item_connector}#{@right_item} in the right hand"
    else
      ""
    end
  end

  # is_stylish is in the eye of the beholder... It will return a true boolean value if it's red or blue.
  # NOTES on limits and exceptional/error cases: is_stylish seems to be a misplaced method as it only dwells on the hat object and not on the LegoMinifigure object per say. If more of a score is tallied for other elements, then this method can exist. 
  def is_stylish?
    @hat.colour == "red" || @hat.colour == "blue"
  end

  # swap_hands places the item from the right to left hand, and vica-versa. returns self 

  def swap_hands
    temp = @right_item
    @right_item = @left_item
    @left_item = temp
    self
  end

  # wear_hat sets a new hat. It's nice, even though the hat attribute already has a writable accessor.
  # new_hat should be a LegoHat object
  def wear_hat(new_hat)
    @hat = new_hat
  end

  # place_in_left_hand sets a new object in it's left_item attribute. It's nice, even though it's attribute already has a writable accessor.
  # new_item should be a LegoItem object 
  def place_in_left_hand(new_item)
    @left_item = new_item
  end

  # place_in_right_hand sets a new object in it's left_item attribute. It's nice, even though it's attribute already has a writable accessor.
  # new_item should be a LegoItem object 
  def place_in_right_hand(new_item)
    @right_item = new_item
  end

  # is_strong? checks the weight of each item compaired to a threshold of 10 and returns a boolean true/false if one of them is true
  def is_strong?
    @left_item.is_heavy(10) || @right_item.is_heavy(10)
  end
end



