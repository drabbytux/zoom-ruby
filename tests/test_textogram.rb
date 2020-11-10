require 'minitest/autorun'

require_relative '../textogram.rb'

class TestTextogram < Minitest::Test
  def setup
    @textogram = Textogram.new
  end

  # start_it(is_case_sensitive = nil, include_non_alphanumberic = nil, words = nil, graph_char ='*')
  def test_case_sensitive_all_charachters
    string_input = "HELLO World!"
    @textogram.start_it('y','y', string_input)
    actual = @textogram.create_hash
    expected = @textogram.word_hash

    assert_equal(expected,actual)
  end

end