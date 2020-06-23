# frozen_string_literal: true
require 'pry'

class Actor
  attr_accessor :name, :symbol, :wins, :move_count

  def initialize(name, symbol, move_count = 0, wins = 0)
    @name = name
    @symbol = symbol
    @wins = wins
    @move_count = move_count
  end

  def get_input(_board = nil)
    print 'Enter a position: '
    gets.chomp.to_i
  end
end

class Player < Actor
  def initialize(name, symbol, move_count = 0, wins = 0)
    super(name, symbol, move_count, wins)
  end
end

class CPU < Actor
  def initialize(name = 'cpu', symbol = 'O', move_count = 0, wins = 0)
    super(name, symbol, move_count, wins)
    @choice = nil
  end

  def get_input(board)
    res = testmax(board, 0, true)
    @choice
  end

  def score(board, depth = 0)
    if board.win?("O")
      10 - depth
    elsif board.win?("X")
      depth - 10
    else 
      0
    end
  end


  def testmax(board, depth = 0, isMaximizingPlayer = true)
    return score(board, depth) if score(board, depth) != 0

    scores = []
    moves = []

    # Current available spots on the board
    available_spots = board.available_spots

    # p available_spots
    return 0 if available_spots.empty?

    available_spots.each do |spot|
      board_copy = clone_board(board)
      board_copy.place_symbol(spot, get_player_symbol(isMaximizingPlayer))

      scores.push(testmax(board_copy, depth + 1, !isMaximizingPlayer))
      moves.push(spot)
    end

    get_best_move(isMaximizingPlayer, moves, scores)
  end

  def get_best_move(isMaximizingPlayer, moves, scores)
    index = get_index(isMaximizingPlayer, scores)
    @choice = moves[index]
    return scores[index]
  end

  def get_index(isMaximizingPlayer, scores)
    isMaximizingPlayer ? scores.each_with_index.max[1] : scores.each_with_index.min[1]
  end

  def get_player_symbol(isMaximizingPlayer)
    isMaximizingPlayer ? 'O' : 'X' 
  end

  def clone_board(board)
    Board.new(board.grid.map(&:clone))
  end
end
