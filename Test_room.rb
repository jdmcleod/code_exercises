require 'csv'
require 'pry'

words = CSV.open('./words.csv').read.first

blacklist = %w[ag]

blacklist.each do |letters|
  if letters.include?("#{blacklist}") == false
    # puts "#{words}".scan(/\w+?#{letters}\w?{5}/)  
   
    possible_words = "#{words}".scan(/\w+?#{letters}\w?{5}/)
    puts "There are #{possible_words.count} possible words left"
    puts "Do you want to see those words? Type yes or no"
user_text = ["yes","no"]
user_text = gets.chomp
    if user_text == "yes"
      puts "#{possible_words}"
    else
      puts "your mom"
    end
  end
end
