require_relative './wordle_solver'

blacklist = %w[a d i o n y l n e i c t p t j]
yellows = { u: [1], r: [3]  }
greens = { r: 1, u: 2, s: 3}

wordle_solver = WordleSolver.new(blacklist, yellows, greens)
wordle_solver.solve
