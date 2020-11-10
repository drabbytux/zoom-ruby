class StudentBody
    include Enumerable
    attr_accessor :classes, :students

    def initialize
      @classes = Hash.new
      populate_classes
    end

    def each(&block)
      @students.compact.each(&block)
    end

    def populate_classes
      sample_classes = [:English,:French,:Geography,:Math, :Science, :Art]
      @students = File.readlines('student_list.txt')
      student_index = 0
      sample_classes.each do |cl|
        @classes[ cl ] = @students.map.with_index {|student, index| student.strip if (index >= student_index) && (index < (student_index + (@students.size / sample_classes.size.to_f).ceil)) }.compact
        student_index = student_index + (@students.size / sample_classes.size.to_f).ceil
      end
    end


    def print_class_list
      @classes.each do |key, students|
        puts "- - - - - - - - - - - - "
        puts key.to_s
        puts "- - - - - - - - - - - - "
        puts "#{students}"
      end

    end

end


## ____________________ ##

sb = StudentBody.new

puts "::: Test with new each. Say Hello!"
sb.each {|i| puts "Hello #{i}" }

puts "::: Test with map ------------------"
puts sb.map {|i| i if i.include? "na" }.compact
puts "::: Test with filter map ------------------"
puts sb.map.filter_map {|i| i if i.include? "te" }