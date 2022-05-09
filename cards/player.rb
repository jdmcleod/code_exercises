class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
    @hand = []
  end

  def hand
    @hand
  end

  def set_hand(cards)
    @hand = cards
  end

  def draw
    card = hand.sample
    hand.delete(card)
  end

  def take_turn(enemy)
    my_card = draw
    enemy_card = draw

    return if my_card.nil? || enemy_card.nil? 

    # puts "#{name} drew #{my_card.to_s} and #{enemy.name} drew #{enemy_card.to_s}"

    result = my_card.beats(enemy_card)

    stack = []

    if result == 'tie'
      stack.push(my_card, enemy_card)
      return take_turn(enemy)
    end

    if result
      @hand << enemy_card
      stack.each { |card| @hand << card }
      # puts name + ' wins this round'
    else
      enemy.hand << my_card
      stack.each { |card| enemy.hand << card }
      # puts name + ' lost this round'
    end
  end
end