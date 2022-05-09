class Player
  attr_reader :name, :game

  def initialize(name, game)
    @name = name
    @game = game
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

    puts "#{name} drew #{my_card.to_s} and #{enemy.name} drew #{enemy_card.to_s}" if game.logging

    result = my_card.beats(enemy_card)

    if result == 'tie'
      game.stack.push(my_card, enemy_card)
      puts "Tie: stack is #{game.stack.map(&:to_s)}" if game.logging
      return take_turn(enemy)
    end

    if result
      @hand.push(enemy_card, my_card)
      game.stack.each { |card| @hand << card }
      puts name + ' wins this round' if game.logging
    else
      enemy.hand.push(my_card, enemy_card)
      game.stack.each { |card| enemy.hand << card }
      puts name + ' lost this round' if game.logging
    end

    game.clear_stack
    puts "#{hand.count} : #{enemy.hand.count}" if game.logging
  end
end
