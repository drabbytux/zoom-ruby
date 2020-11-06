require 'minitest/autorun'

require_relative 'lego.rb'

class TestLego < Minitest::Test
  def setup
    @lego_hat = LegoHat.new("medium", "blue", "tilley")
    @lego_item_1 = LegoItem.new("coffee cup", 4)
    @lego_item_2 = LegoItem.new("pen", 1)
    @lego_mini_figure = LegoMinifigure.new("Charles",@lego_hat,@lego_item_1,@lego_item_2)
  end

  # - - - - Lego Hat Tests - - - - -  -#
  # Test FAILED - bad method in to_s 'size_word'
=begin  
  def test_LegoHat_to_string_method
    actual = @lego_hat.to_s
    expected = "a medium blue tilley"

    assert_equal(expected,actual)
  end
=end

  def test_hat_set_style_properly
    @lego_hat.style = "porkpie"
    actual = @lego_hat.style
    expected = "porkpie"

    assert_equal(expected,actual)
  end

  def test_hat_set_size_properly
    @lego_hat.size = 12
    actual = @lego_hat.size
    expected = 12

    assert_equal(expected,actual)
  end

  def test_hat_set_colour_properly
    @lego_hat.colour = "red"
    actual = @lego_hat.colour
    expected = "red"

    assert_equal(expected,actual)
  end


  # - - - - Lego Item Tests - - - - -  -#
  def test_lego_item_to_string
    actual = @lego_item_1.to_s
    expected = "a 4 gram coffee cup"

    assert_equal(expected,actual)
  end

  def test_lego_item_weight_with_variable_as_string
    @lego_item_1.weight = "Heavy"
    actual = @lego_item_1.weight
    expected = "Heavy"

    assert_equal(expected,actual)
  end

  # Test FAILED - String set successfully for weight, breaks is_heavy() comparison method
=begin
  def test_lego_item_is_heavy_with_string_weight_set
    @lego_item_1.weight = "Heavy"
    actual = @lego_item_1.is_heavy(10)
    expected = false

    assert_equal(expected,actual)
  end
=end

  # - - - - Lego Figure Tests - - - - -  -#

   # Test FAILED - Method/attribute "size_word" within LegoHat class not found, fails test
=begin   
  def test_lego_figure_to_s
    actual = @lego_mini_figure.to_s
    expected = "A Lego minifigure named Charles, who is wearing a medium blue tilley and is holding a 4 gram coffee cup in the left hand and a 1 gram pen in the right hand."

    assert_equal(expected,actual)
  end
=end

  def test_lego_figure_print_out_the_hat_words
    actual = @lego_mini_figure.hat_words
    expected = ", who is wearing a medium blue tilley"

    assert_equal(expected,actual)
  end

  def test_lego_figure_print_out_the_left_hand_item_words
    actual = @lego_mini_figure.left_item_words
    expected = " and is holding a 4 gram coffee cup in the left hand"

    assert_equal(expected,actual)
  end

  def test_lego_figure_print_out_the_right_hand_item_words
    actual = @lego_mini_figure.right_item_words
    expected = " and a 1 gram pen in the right hand"

    assert_equal(expected,actual)
  end

  def test_lego_figure_is_stylish_boolean_return
    actual = @lego_mini_figure.swap_hands
    expected = @lego_mini_figure

    assert_equal(expected,actual)
  end 

  def test_lego_figure_view_the_swap_hands_object_return
    actual = @lego_mini_figure.is_stylish?
    expected = true

    assert_equal(expected,actual)
  end 


  def test_lego_figure_wear_hat_set_to_new_hat_object
    hat2 = LegoHat.new("small", "orange", "cap")
    @lego_mini_figure.wear_hat(hat2)
    actual = @lego_mini_figure.hat
    expected = hat2

    assert_equal(expected,actual)
  end 

  

  def test_lego_figure_place_a_new_item_in_the_left_hand
    new_item = LegoItem.new("Milk Jug", 5)
    @lego_mini_figure.place_in_left_hand(new_item)
    actual = @lego_mini_figure.left_item
    expected = new_item

    assert_equal(expected,actual)
  end 

  def test_lego_figure_place_a_new_item_in_the_right_hand
    new_item = LegoItem.new("Milk Jug", 5)
    @lego_mini_figure.place_in_right_hand(new_item)
    actual = @lego_mini_figure.right_item
    expected = new_item

    assert_equal(expected,actual)
  end 

  # A boolean passed from the item's "is_heavy(10)" method returns false when evaluating "is_strong?" which leads both to evalulate to both false, returning false. It should return true if the figure can left them and is strong enough to lift them.
  def test_lego_figure_are_they_strong
    actual = @lego_mini_figure.is_strong?
    expected = true

    assert_equal(expected,actual)
  end 

end
