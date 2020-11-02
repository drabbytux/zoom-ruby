class Domino

  attr_accessor :domino_value

  def initialize
    @dot = "*"
    @space = " "
    @domino_value = 0
  end

  def half_value(top_or_bottom)
    if top_or_bottom == "top"
      @domino_value > 6 ? @domino_value - 6 : 0
    else
      @domino_value > 6 ? 6 : @domino_value
    end
  end

  def to_s
    puts "---"
    puts get_domino_half( half_value("top") )
    puts "~~~"
    puts get_domino_half( half_value("bottom") )
    puts "///\n\n"
  end
  
  def get_domino_half(number)
    str_half = ""
    (1..3).each do |line_number|
      str_half = str_half + get_line_pattern(number, line_number) + "\n"
    end
    str_half
  end

  def get_line_pattern(number, line_number)
    str_line = ""
    (1..3).each do |dot_row|
      if dot_row == 1
        if line_number == 1
          str_line = ([2,3,4,5,6].include? number) ? str_line + @dot : str_line + @space
        elsif( line_number == 2)
          str_line = (number == 6 ) ? str_line + @dot : str_line + @space
        else
          str_line = ([4,5,6].include? number ) ? str_line + @dot : str_line + @space
        end
      elsif dot_row == 2
          if( line_number == 2)
            str_line = ( [1,3,5].include? number ) ? str_line + @dot : str_line + @space
          else
            str_line = str_line + @space
          end
      else  #3 dot row
          if line_number == 1
            str_line = ([4,5,6].include? number) ? str_line + @dot : str_line + @space
          elsif( line_number == 2)
            str_line = (number == 6 ) ? str_line + @dot : str_line + @space
          else
            str_line = (number > 1 ) ? str_line + @dot : str_line + @space
          end
      end
    end
    str_line
  end

  def output_entire_set
    (1..12).each do |number|
      @domino_value = number
      to_s
    end
  end

end


# _____________________________ #

dom = Domino.new
dom.domino_value = 8
dom.to_s

dom.output_entire_set