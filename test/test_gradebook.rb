=begin
1) Identify the purpose of the classes.
  GradeBook: The purpose is to house a group of class grades and to allow grades to be added and viewed in a hash data type

  Float: The purpose is to add a method for showing the grades based on a Float object

2) Identify the purpose of the methods.

  add_grade(student, grade)
    - Add a student with a float grade
  get_grade(student)
    - retrieve a grade from the grades hash list using a student symbol
  letter_grades
    - Shows the available list of grades entered as letter grades
  letter_grade(student)
    - Shows a specific letter grade based on a student symbol reference within the grades hash

3) Identify the groups of expected behaviour.
  letter_grades and letter_grade depend upon Float's to_grade method

4) Identify the limits of the cases of expected behaviour.

5) Identify any exceptional/error cases.
- letter_grade(student) requires a student symbol, so when passed a string (others default), it doesn't convert it to a symbol.

-letter_grade(student) also uses an unknown grade(student) method not declarared within the class

6) Test each of these cases separately.

=end


require 'minitest/autorun'

require_relative '../gradebook.rb'

class TestGradeBook < Minitest::Test
  def setup
    @gradebook = GradeBook.new
  end

  def test_adding_a_student_and_grade
    actual = @gradebook.add_grade("charles", 12)
    expected = @gradebook.get_grade("charles")
    
    assert_equal(expected,actual)
  end

  def test_get_grade_from_student_string
    @gradebook.add_grade("charles", 12)
    actual = @gradebook.get_grade("charles")
    expected = 12
    
    assert_equal(expected,actual)
  end

  def test_return_of_hash_data_with_all_letter_grades
    @gradebook.add_grade("charles", 12)
    @gradebook.add_grade("charles2", 95)
    actual = @gradebook.letter_grades
    expected = {charles: 'F', charles2: 'A'}
    
    assert_equal(expected,actual)
  end

  # Did not pass. Expecting a symbol, or unclear on value needed passing - function didn't convert string->Symbol
  def test_getting_a_letter_grade_from_a_student_string
    @gradebook.add_grade("charles2", 95)
    actual = @gradebook.letter_grade("charles2")
    expected = 'A'
    
    assert_equal(expected,actual)
  end

  def test_float_to_grade
    actual = 12.2.to_grade
    expected = 'F'
    
    assert_equal(expected,actual)
  end


end