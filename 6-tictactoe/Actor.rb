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
  end

  def get_input(board)
    # rand(1..9
    minimax(board)
  end

  def score(board)
    if board.win?(symbol)
      -1
    elsif board.win?(Player.symbol)
      1
    else
      0
    end
  end

  def minimax(board, _current_player = nil, _opponent = nil)
    board.available_spots.sample
    # return score(board) if score(board) != 0

    # move = nil
    # score = -2
    # grid_copy = board.grid.map(&:clone)

    # 3.times do |y|
    #   3.times do |x|
    #     next unless board[x][y] = '_'

    #     grid_copy[y][x] = current_player.symbol
    #     test_board = Board.new(grid_copy)
    #     current_player, opponent = opponent, current_player
    #     score_for_move = -minimax(test_board, current_player, opponent)
    #   end
    # end
  end
end

# minimax(board, opponent_symbol)
# 	hash = { -1 => opponent, 0 => blank, 1 = you }
# 	if board.win?(opponent) || board.win?(you)
# 		return whoever won (-1 or 1)
#
#   move = -1 (this is the answer aka the final answer aka which position is most optimal)
#             (maybe have the default value of nil?)
#   score = -2 (idk why start with -2)
#
# 	for each space in board
# 		if the space is blank
# 			create board copy
# 			put your move at this space
# 			score_for_the_move = -minimax(copyboard, you) (note the negative) (why negative)
# 			if score for the move > score
#         change score to score_for_the_move
#         change move to current i
#
#
#   return nil if move = nil (it means there is no available move(?))
