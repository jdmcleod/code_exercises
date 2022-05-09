require_relative 'game'

# puts 'Enter names of players:'

# players = gets.chomp.split

josh_wins = 0
joby_wins = 0

1000.times do |n|
  game = Game.new(['Joby', 'Josh'])
  winner = game.start

  josh_wins += 1 if winner.include?('Josh')
  joby_wins += 1 if winner.include?('Joby')
end

puts "Josh won #{josh_wins} times"
puts "Joby won #{joby_wins} times"

greater_value = [josh_wins, joby_wins].max
lesser_value = [josh_wins, joby_wins].min

difference = greater_value - lesser_value

name = josh_wins == greater_value ? 'Josh' : 'Joby'
puts "\n #{name} won the whole match by #{difference} rounds \n\n"

