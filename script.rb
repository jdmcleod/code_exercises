require_relative './wordle_solver'

blacklist = %w[g u i d e t o r y c m p]
yellows = {  }
greens = { s: 0, h: 1, a: 2}

wordle_solver = WordleSolver.new(blacklist, yellows, greens)
