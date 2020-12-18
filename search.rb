require 'json'

class SearchEngine
  attr_accessor :search_hash, :current_search_string
  attr_accessor :search_db

  def initialize
    @search_hash = load_products
    generate_search_db
  end

  def display_products
    @search_hash.each do |item|
      puts item[:name]
    end
  end

  def search_names
    if(current_search_string.size>0)
      if( @search_db[@current_search_string] )
        @search_db[@current_search_string].each do |found_item|
          puts found_item
        end
      end
    end
  end

  def get_search_input
    search_string = gets.chomp
    if(search_string != 'exit')
      @current_search_string = search_string.downcase
      true
    end
  end

  private 
    def load_products
      eval(IO.read('products_small.json')).sort_by { |e| e[:key1] }
    end

    def generate_search_db
      @search_db = Hash.new
      @search_hash.each do |item|
        # slice up the name stuff
        str_name = item[:name].split(' ')
        str_name.each do |str|
          if( @search_db.key?(str.downcase) )
            @search_db[str.downcase] << [{id: item[:id], name: item[:name], string: str.downcase}]
          else
            @search_db[str.downcase] = [{id: item[:id], name: item[:name], string: str.downcase}]
          end
        end
      end
    end
end


# --------  R U N   T I M E -------- #
s = SearchEngine.new
# s.display_products

active_search = true
# puts s.search_db
while(active_search)
  print "What would you like to search for today? "
  active_search = s.get_search_input
  if active_search
    s.search_names
  else
    puts "Thanks for playing!"
  end
end
