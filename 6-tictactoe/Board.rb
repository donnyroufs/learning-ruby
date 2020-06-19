# frozen_string_literal: true

class Board
  POS = {
    1 => [0, 0],
    2 => [0, 1],
    3 => [0, 2],
    4 => [1, 0],
    5 => [1, 1],
    6 => [1, 2],
    7 => [2, 0],
    8 => [2, 1],
    9 => [2, 2]
  }.freeze

  attr_reader :grid

  def initialize(grid = Array.new(3) { Array.new(3, '_') })
    @grid = grid
  end

  def render
    available_spots
    puts ''
    3.times do |i|
      puts " #{grid[i][0]} | #{grid[i][1]} | #{grid[i][2]} "
    end
    puts ''
  end

  def place_symbol(num, val)
    y, x = POS[num]
    grid[y][x] = val
  end

  def win?(symbol)
    win_row?(symbol) || win_col?(symbol) || win_diag?(symbol)
  end

  def tie?(total_moves)
    total_moves == 9
  end

  def is_free?(move)
    y, x = POS[move]
    @grid[y][x] == '_'
  end

  def available_spots
    spots = []

    (1..9).each do |pos|
      row, col = POS[pos]
      spot = grid[row][col]
      spots << pos if spot == '_'
    end

    spots
  end

  private

  def win_row?(symbol)
    grid.any? do |row|
      empty_space?(row) ? false : row.all? { |el| el == symbol }
    end
  end

  def win_col?(symbol)
    grid.transpose.any? do |col|
      empty_space?(col) ? false : col.all? { |el| el == symbol }
    end
  end

  def win_diag?(symbol)
    diagonal = Array.new(3) { |i| grid[i][i] }
    opposite_diagonal = Array.new(3) do |i|
      y = i
      x = ((grid.length - 1) - i)
      grid[y][x]
    end
    both_diagonals = [diagonal, opposite_diagonal]

    both_diagonals.any? do |diag|
      empty_space?(diag) ? false : diag.all? { |el| el == symbol }
    end
  end

  def empty_space?(array)
    array.any? { |el| el == '_' }
  end
end
