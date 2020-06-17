class Actor
	attr_accessor :name, :symbol, :wins, :move_count

    def initialize(name, symbol, move_count = 0, wins = 0)
        @name = name
		@symbol = symbol
        @wins = wins
        @move_count = move_count
    end
end

class Player < Actor
	def initialize(name, symbol, move_count = 0, wins = 0)
		super(name, symbol, move_count, wins)
    end
    
    def get_input
        print "Enter a position: "
        pos = gets.chomp.to_i
    end
end

    # ('a'..'z').include? "cc" # false
    # ('a'..'z').cover? "cc"   # true