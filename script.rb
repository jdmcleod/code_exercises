require_relative './wordle_solver'
require_relative './word_collector'

word_collector = WordCollector.new
word_collector.execute
wordle_solver = WordleSolver.new(word_collector.greys, word_collector.yellows, word_collector.greens)
wordle_solver.solve
