class Board
  attr_reader :grid

  def initialize
    @grid = #Array.new(3) { Array.new(3, "_") }
    [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]
  end

  def render
    3.times do |i|
        puts " #{grid[i][0]} | #{grid[i][1]} | #{grid[i][2]} "
    end
  end

  def place_symbol(pos, val)
    y, x = pos
    grid[y][x] = val
  end

  def win?(symbol)
    win_row? || win_col? || win_diag?
  end
  
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
    diagonals = grid.collect { |i| grid[i][i] }
    opposite_diagonals = grid.collect { }
  end

  private

  def empty_space?(array)
    array.any? { |el| el == '_' }
  end
end


=begin 
 public void CheckForWinner(Button[] b)
        {
            String[] board = new string[9];
            
            for(int i = 0; i < board.Length; i++)
            {
                board[i] = b[i].Text;
            }
            
            int[,] winCombos = new int[8, 3]
            {
                { 0, 1, 2 },
                { 3, 4, 5 },
                { 6, 7, 8 },
                { 0, 3, 6 },
                { 1, 4, 7 },
                { 2, 5, 8 },
                { 0, 4, 8 },
                { 6, 4, 2 },
            };

            for (int i = 0; i < 8; i++)
            {
                if (board[winCombos[i, 0]] == board[winCombos[i, 1]] && board[winCombos[i, 1]] == board[winCombos[i, 2]] && !string.IsNullOrEmpty(board[winCombos[i, 0]]))
                {
                    gameState = State.Winner;
                    break;
                } else if (TurnCount >= 9)
                {
                    gameState = State.Draw;
                }
                else
                {
                    gameState = State.Playing;
                }
            }
        }
=end