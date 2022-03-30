require 'csv'
require 'pry'

words = CSV.open('./words.csv').read.first

yellowlist = %w[x]

yellowlist.each do |letters|
  # if letters.include?("#{yellowlist}") == false
    # puts "#{words}".scan(/\w+?#{letters}\w?{5}/)  
   
    possible_words = "#{words}".scan(/\w+?#{letters}\w?{5}/)
    puts "There are #{possible_words.count} possible words remaining"
    puts "Do you want to see those words? Type yes or no"
user_text = ["yes","no"]
user_text = gets.chomp
    if user_text == "yes"
      puts "#{words}".scan(/\w+?#{letters}\w?{5}/)
    else
      puts "your mom"
    end
  end
