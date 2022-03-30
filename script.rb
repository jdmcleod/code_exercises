require 'csv'
require 'pry'

words = CSV.open('./words.csv').read.first

blacklist = %w[a b c]

blacklist.each do |letters| letters == blacklist
   if letters.include?("c") == true
    puts "#{words}".scan(/\w+?#{letters}\w?{5}/)
  
    # puts "#{words}".scan(/\w+#{'a'}/)
    # puts "#{words}".scan(/\w?{5}\w+?#{'a'}/)
    # puts "#{words}".scan(/['a']{5}/)
    # puts "#{words}".scan(/\w{5}/)
end
end



# store only words that do not contain any letters in the blacklist array

# puts possible_words
