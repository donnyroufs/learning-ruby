class Actor
	attr_accessor :name, :symbol, :wins

    def initialize(name, symbol, wins = 0)
        @name = name
		@symbol = symbol
		@wins = wins
    end
end

class Player < Actor
	def initialize(name, symbol, wins = 0)
		super(name, symbol, wins)
    end
    
    def move(pos, place_symbol)

    end
end