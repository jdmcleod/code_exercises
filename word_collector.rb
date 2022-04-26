require 'pry'

##
# Takes an array of words in the format
#  - lowercase letter for grey letters
#  - uppercase letters for yellow letters
#  - letters preceeded by a '>' character are greens
# It will store the corresponding letters and indexes in 3 values
class WordCollector
  attr_accessor :greys, :yellows, :greens

  def initialize
    @greys = []
    @yellows = {}
    @greens = {}
  end

  def execute
    print_welcome_message
    words = gets.chomp.split
    process_words(words)
  end

  def process_words(words)
    store_greys_and_yellows(words)

    words.each do |word|
      word.split('').each_with_index do |char, index|
        next unless char == '>'
        char = word[index + 1]
        pointer_count = word[0..index].split('').count('>')
        index_of_letter = (index + 1) - pointer_count

        greys.delete(char.downcase)
        greys.uniq!
        yellows.delete(char.downcase)
        greens[char.downcase] = (greens[char.downcase] || []).push(index_of_letter)
        greens[char.downcase].uniq!
      end
    end
  end

  private

  def store_greys_and_yellows(words)
    words.each do |word|
      word.gsub('>', '').split('').each_with_index do |char, index|
        if char.downcase == char
          greys.push(char)
        else
          greys.delete(char.downcase)
          greys.uniq!
          yellows[char.downcase] = (yellows[char.downcase] || []).push(index)
          yellows[char.downcase].uniq!
        end
      end
    end
  end

  def print_welcome_message
    puts '-----------------------------'
    puts 'Welcome to the Wordle Solver!'
    puts '  Enter your guesses separated by spaces with the following format'
    puts '    - lowercase for grey letters'
    puts '    - uppercase for yellow letters'
    puts '    - preceed green letters with > character'
    puts '  example: auDi>o >CROwn'
    puts ''
  end
end
