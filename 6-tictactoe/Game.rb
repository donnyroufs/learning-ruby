require_relative "Board.rb"
require_relative "Actor.rb"
require_relative "Constants.rb"

class Game
    def initialize
       @board = Board.new 
       @players = Array.new 
       @total_move_count = 0

       setup
    end

    def start
       until game_over? do
            refresh

            current_player = player_turn
            input = nil

            loop do
                print "#{current_player.name}'s move: "
                input = current_player.get_input
                break if (1..9).include?(input)
            end

            update
            board.place_symbol(input, current_player.symbol)
       end

       refresh
       print_winner
    end

    private 

    attr_reader :board, :players

    def setup
        set_players
    end

    def set_players
        2.times do |i|
            print "Player #{i+1} name: "
            name = gets.chomp
            symbol = i == 0 ? MARK_X : MARK_O
            @players << Player.new(name, symbol)
        end
    end

    def player_turn 
        @players[@total_move_count % 2]
    end

    def game_over?
        board.win?(players[0].symbol) || board.win?(players[1].symbol)
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
        system("cls")
        @board.render
    end
end