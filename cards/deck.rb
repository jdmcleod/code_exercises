require_relative 'card'

SUITES = ['clubs', 'spades', 'hearts', 'diamonds']
RANKS = ['ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king']

class Deck
  def initialize
    @cards = []    
  end

  def cards
    @cards
  end

  def shuffle
    @cards.shuffle!
  end
  
  def build_deck
    SUITES.each do |suite|
      RANKS.each do |rank|
        @cards.push(Card.new(rank, suite))
      end
    end
  end
end