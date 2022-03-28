require 'csv'
require 'pry'

words = CSV.open('./words.csv').read.first

blacklist = %w[a i t]

possible_words = []
binding.pry
# store only words that do not contain any letters in the blacklist array

puts possible_words
