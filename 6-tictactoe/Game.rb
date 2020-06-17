require_relative "Board.rb"
require_relative "Actor.rb"
require_relative "Constants.rb"

class Game
    def initialize
       @board = Board.new 
       @players = Array.new 

       setup
    end

    def start
       @board.render
       puts @players.inspect
    end

    private 

    def setup
        set_players
    end

    def set_players
        2.times do |i|
            print "What's your name? "
            name = gets.chomp
            symbol = i == 0 ? MARK_X : MARK_O
            @players << Player.new(name, symbol)
        end
    end
end