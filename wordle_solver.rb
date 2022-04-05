require 'csv'
require 'pry'

class WordleSolver
  attr_reader :blacklist, :yellows, :greens
  attr_accessor :possible_words

  def initialize(blacklist, yellows, greens)
    @blacklist = blacklist
    @yellows = yellows
    @greens = greens
    @possible_words = []
  end

  def solve
    add_words_that_match_greens
    filter_out_grey_letters
    filter_out_words_without_yellows

    puts possible_words.length, possible_words
  end

  private

  def add_words_that_match_greens
    words.each do |word|
      if greens.all? { |letter, index| word[index] == letter.to_s }
        possible_words.push(word)
      end
    end
  end

  def filter_out_grey_letters
    possible_words.reject! do |word|
      blacklist.any? { |letter| word.include? letter }
    end
  end

  def filter_out_words_without_yellows
    possible_words.filter! do |word|
      yellows.all? do |letter, positions|
        word.include?(letter.to_s) && positions.all? do |position|
          word[position] != letter.to_s
        end
      end
    end
  end

  def words
    CSV.open('./words.csv').read.first
  end
end