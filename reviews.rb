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

relevant_lines = lines.find_all{|line|line.include?("Truncated")}
puts relevant_lines

reviews = relevant_lines.reject{|line| line.include?("--")}
p reviews