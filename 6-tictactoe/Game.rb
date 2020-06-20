# frozen_string_literal: true

require_relative 'Board.rb'
require_relative 'Actor.rb'
require_relative 'Constants.rb'

class Game
  def initialize
    @board = Board.new
    @players = []
    @total_move_count = 0

    setup
  end

  def start
    until game_over? || game_tie?
      refresh

      current_player = player_turn
      input = nil

      loop do
        print "#{current_player.name}'s move: "
        input = current_player.get_input(board)
        puts "inputs was #{input}"
        board.render
        break if valid_move?(input)
      end

      update
      board.place_symbol(input, current_player.symbol)
    end

    refresh
    if game_over?
      print_winner
    else
      print_tie
    end
  end

  private

  attr_reader :board, :players

  def setup
    set_game_mode
    set_players
  end

  def set_game_mode
    puts '1. human vs human'
    puts '2. human vs cpu'
    input = gets.chomp.to_i
    if input.between?(0, 2)
      @mode = input
    else
      system('clear')
      set_game_mode
    end
  end

  def set_players
    if @mode === 1
      2.times do |i|
        print "Player #{i + 1} name: "
        name = gets.chomp
        symbol = i == 0 ? MARK_X : MARK_O
        @players << Player.new(name, symbol)
      end
    else
      print 'Player 1 name: '
      name = gets.chomp
      @players << Player.new(name, 'X')
      @players << CPU.new
    end
  end

  def player_turn
    @players[@total_move_count % 2]
  end

  def valid_move?(input)
    (1..9).include?(input) && board.is_free?(input)
  end

  def game_tie?
    board.tie?(@total_move_count)
  end

  def game_over?
    board.win?(players[0].symbol) || board.win?(players[1].symbol)
  end

  def print_tie
    puts 'Game Tie'
  end

  def print_winner
    previous_player = @players[@total_move_count % 2 - 1]
    puts "#{previous_player.name} won the game, with #{previous_player.move_count} moves!"
  end

  def update
    @total_move_count += 1
    player_turn.move_count += 1
  end

  def refresh
    system('cls')
    @board.render
  end
end
