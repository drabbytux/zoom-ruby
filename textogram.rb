class Textogram

  attr_accessor :word_hash, :charachters_only

  def initialize
    @word_hash = Hash.new
    @charachters_only = true
  end

  def start_it(is_case_sensitive = nil, include_non_alphanumberic = nil, words = nil, graph_char ='*')
    if ( is_case_sensitive && include_non_alphanumberic && words )
      @choice_case_sensitive = is_case_sensitive
      @choice_include_non_alphanumberic = include_non_alphanumberic
      @choice_graph_char = graph_char
      @choice_word = words
    else
      present_choices
    end
    create_hash
    print_textogram_hash
  end

  def create_hash
    apply_word_restrictions
    if @charachters_only
     @word_hash = Hash[@choice_word.delete(' ').split('').group_by{|char| char}.map{|key, val| [key, val.size]}].sort_by {|k, v|[-k, v]}
    else
      @word_hash = Hash[@choice_word.split(' ').group_by{|char| char}.map{|key, val| [key, val.size]}]
    end
  end

  def apply_word_restrictions
    if @choice_case_sensitive =='n'
      @choice_word.downcase!
    end

    if @choice_include_non_alphanumberic == 'n'
      if charachters_only
      @choice_word.gsub!(/\W/,'')
      else
        @choice_word.gsub!(/\W^\s/,'')
      end
    end
  end

  def print_textogram_hash
    @word_hash.each do |char, occurences|
      print "#{char} "
      occurences.times {print @choice_graph_char }
      print "\n"
    end
    puts "- - - - - - - - - -"
  end

  def present_choices
    puts "Would you like this to be case sensitive? (y/n)"
    @choice_case_sensitive = gets.chomp
    puts "Should it include non-alphanumberic characters? (y/n)"
    @choice_include_non_alphanumberic = gets.chomp
    puts "What character do you wish to use for the chart line?"
    @choice_graph_char = gets.chomp
    puts "And finallyh, what terms would you like to use?"
    @choice_word = gets.chomp
  end
end


## _________R U N  T I M E_____________ ##


t = Textogram.new
t.start_it('n','y',"HELLO World!",'*')

t.start_it('y','y',"HELLO World!",'*')

t.start_it('y','n',"HELLO World!",'*')

t.start_it('y','n',"",'*')

# - - - NEW - - - - #

t.charachters_only = false # Do words instead!
t.start_it('y','n',"HELLO World Another one and another one and another...!",'*')

str_file = File.read('textogram_text_example.txt')
t.start_it('y','n',str_file,'*')