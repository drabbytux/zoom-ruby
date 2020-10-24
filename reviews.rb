lines = []
File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

def reject
  kept_items = []
  self.each do |item|
    unless yield(item)
      kept_items << itemend
    end
    kept_items
  end
end

def find_adjective(string)
  words = string.split(" ")
  index = words.find_index("is")
  words[index + 1]
end

relevant_lines = lines.find_all{|line|line.include?("Truncated")}
puts relevant_lines

reviews = relevant_lines.reject{|line| line.include?("--")}
p reviews

string = reviews.first
words = string.split(" ")
p words

adjectives = []

reviews.each do |review|
  adjectives << find_adjective(review)
end

puts adjectives