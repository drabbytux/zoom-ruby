# -- Book Class - - - - - - - - -
class Book
  attr_accessor :title, :page_count

  def initialize (title, page_count)
    @title = title
    @page_count = page_count
  end
end

# -- Reader Class - - - - - - - - -
class Reader
  attr_accessor :current_book_list

  def initialize
    @current_book_list = []
  end

  def read book
    if book
      @current_book_list.push(book)
      puts "You are now reading #{book.title}"
    end
  end

  def return book_title
    index = @current_book_list.find_index{|b| b.title==book_title}
    if index
      @current_book_list.delete_at(index)
    else
      puts "You currently don't possess #{book_title}, so you can't return something you don't have silly..."
    end
  end

end

# -- LittleFreeLibrary Class - - - - - - - - -
class LittleFreeLibrary
  Max_books = 18
  attr_accessor :inventory

  def initialize
    @inventory = []
    populate_library
  end

  def look_at_all_books
    puts "- View all of the books (#{@inventory.size}) - "
    puts "Sorry - there are no books" if @inventory.size==0
    @inventory.map { |b| puts "#{b.title} (#{b.page_count} pages)"}
  end

  def add_book book
    if book
      if( @inventory.size < Max_books )
          @inventory.push book
      else
        puts "We were not able to add your book \"#{book.title}\". The library is full."
      end
    end
  end

  def checkout book_title
    index = @inventory.find_index{|b| b.title==book_title}
    if index
      @inventory.delete_at(index)
    end
  end

  def populate_library
    book_file = File.open("books.txt")
    book_file.readlines.each do |line|
      arr_book = line.split /\,(?=[^,]*$)/
      if arr_book.size > 1
        self.add_book(Book.new arr_book[0], arr_book[1].strip)
      end
    end
    book_file.close
  end

  def save_library
    book_file = File.open("books.txt", "w")
    @inventory.each {|book| book_file.write "#{book.title}, #{book.page_count}\n" }
    book_file.close
  end

end


# -- run time - - - - - - - - - - - - - - - - 
library = LittleFreeLibrary.new
reader = Reader.new

# Let us look at the books
library.look_at_all_books

# Let's take one out, and try to take out an imaginary one.
reader.read library.checkout("Legend")
reader.read library.checkout("The book with a bad title")

# Test to see if it was removed
library.look_at_all_books

# The reader should return the book now, and one we THOUGHT we had but doesn't exist.
library.add_book reader.return("Legend")
library.add_book reader.return("The book with no name.")

# Finish up by saving the current books
library.save_library
