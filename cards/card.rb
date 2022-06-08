require 'pry'

class Card
  VALUE_MAPPING = {
    'ace' => 14,
    'king' => 13,
    'queen' => 12,
    'jack' => 11,
    '10' => 10,
    '9' => 9,
    '8' => 8,
    '7' => 7,
    '6' => 6,
    '5' => 5,
    '4' => 4,
    '3' => 3,
    '2' => 2
  }

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
  end 

  def rank
    @rank
  end

  def suite
    @suite
  end

  def to_s
    "#{rank} of #{suite}"
  end

  def beats(other_card)
    value > other_card.value
  end
  
  def value
    VALUE_MAPPING[rank]
  end
end

