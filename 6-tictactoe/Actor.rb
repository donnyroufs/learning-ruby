# frozen_string_literal: true

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
    # rand(1..9
    #minimax(board)
    res = testmax(board, 0, true)
    # p "result: #{res}" 
    @choice
  end

  def score(board, isMaximizingPlayer, depth = 0)
    if board.win?(get_player_symbol(isMaximizingPlayer))
      10 - depth
    elsif board.win?(get_player_symbol(!isMaximizingPlayer))
      depth - 10
    else 
      0
    end
  end


  def testmax(board, depth = 0, isMaximizingPlayer = true)
    return score(board, isMaximizingPlayer, depth) if score(board, isMaximizingPlayer, depth) != 0
    scores = []
    moves = []

    # Current available spots on the board
    available_spots = board.available_spots

    # p available_spots
    return 0 if available_spots.empty?

    available_spots.each do |spot|
      board_copy = clone_board(board)
      board_copy.place_symbol(spot, get_player_symbol(isMaximizingPlayer))
      score = testmax(clone_board(board_copy), depth + 1, !isMaximizingPlayer)
      next if score == nil
      scores << score
      moves << spot
    end

    if isMaximizingPlayer
      max_idx = scores.each_with_index.max[1]
      @choice = moves[max_idx]
      return scores[max_idx]
    else
      min_idx = scores.each_with_index.min[1]
      @choice = moves[min_idx]
      return scores[min_idx]
    end
  end

  def get_player_symbol(isMaximizingPlayer)
    isMaximizingPlayer ? 'O' : 'X' 
  end

  def clone_board(board)
    Board.new(board.grid.map(&:clone))
  end
end
