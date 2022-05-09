require_relative 'deck'
require_relative 'player'
require 'pry'

class Game
  attr_reader :players

  def initialize(players)
    @players = []

    players.each do |player|
      @players.push(Player.new(player))
    end
  end

  def start
    @deck = Deck.new
    @deck.build_deck
    @deck.shuffle

    # puts "\n Starting game! \n\n"

    players[0].set_hand(@deck.cards[0..25])
    players[1].set_hand(@deck.cards[26..51])

    until @gameover
      player1.take_turn(player2)
      player2.take_turn(player1)

      @gameover = true if players.any? { |p| p.hand.empty? }
    end

    # puts "\n Game over! #{winner} won! \n\n"
    "\n Game over! #{winner} won! \n\n"
  end

  def player1
    players[0]
  end

  def player2
    players[1]
  end

  def winner
    players.sort { |p| p.hand.count }.reverse.first.name
  end
end