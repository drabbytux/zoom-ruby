class Product

  attr_accessor :products

  def initialize product_array
    @products = Array.new
    @products = format_proper_product_array(product_array)
  end

  def format_proper_product_array(product_array)
    product_array.each_with_index do |str, index|
      item = str.split(',')
      product_array[index] = [item[0],item[1].to_i, item[2].to_i]
    end
    product_array
  end

  def sort_by_popularity
    @products.sort_by! {|item| [-item[1], item[2]]}
  end

  def display_product_names
    @products.each {|item| puts item[0]}
  end

end


# ______ START _______________#

p = Product.new( [
"Selfie Stick,98,29",
"iPhone Case,90,15",
"Fire TV Stick,48,49",
"Wyze Cam,48,25",
"Water Filter,56,49",
"Blue Light Blocking Glasses,90,16",
"Ice Maker,47,119",
"Video Doorbell,47,199",
"AA Batteries,64,12",
"Disinfecting Wipes,37,12",
"Baseball Cards,73,16",
"Winter Gloves,32,112",
"Microphone,44,22",
"Pet Kennel,5,24",
"Jenga Classic Game,100,7",
"Ink Cartridges,88,45",
"Instant Pot,98,59",
"Hoze Nozzle,74,26",
"Gift Card,45,25",
"Keyboard,82,19"
] )

p.sort_by_popularity
p.display_product_names