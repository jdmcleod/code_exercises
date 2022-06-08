require 'pry'
require_relative 'card'

SUITES = %w[diamonds spades hearts clubs]
RANKS = %w[2 3 4 5 6 7 8 9 10 jack queen king ace]

class Deck

  attr_accessor:cards
  def initialize
    @cards = []
  end

  def build_deck
    SUITES.each do |suite|
      RANKS.each do |rank|
        @cards << Card.new(rank, suite)
      end
    end
  end 

  def cards
    @cards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end