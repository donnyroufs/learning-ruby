=begin 
  Requires:
  variables, data types, and numerical operators
  basic input/output
  logic (if statements, switch statements)
  loops (for, while, do-while)
  psudo random numbers

  Write a program that calculates a random number 1 through 100. The program then asks the user to guess the number.
  If the user guesses too high or too low then the program should output "too high" or "too low" accordingly.
  The program must let the user continue to guess until the user correctly guesses the number.

  ★ Modify the program to output how many guesses it took the user to correctly guess the right number.

  ★★ Modify the program so that instead of the user guessing a number the computer came up with, the computer guesses the number that the user has secretely decided. The user must tell the computer whether it guesed too high or too low.

  ★★★★ Modify the program so that no matter what number the user thinks of (1-100) the computer can guess it in 7 or less guesses.
=end

#starts here
class Computer
  def initialize 
    @answer = 50
    @max = 101
    @min = 0
  end

  def guess
    @answer
  end

  def change_answer(status)
    if status == "Too low!"
      @min = @answer
      @answer = ((@max - @answer) / 2) + @answer
    else
      @max = @answer
      @answer = @answer - ((@min - @answer).abs / 2)
    end
  end
end

class Game
  def initialize(mode = 'human')
    @answer = rand(1..100)
    @guesses = 0
    @mode = mode
    
    start
  end

  def start
    if @mode == "computer"
      computer = Computer.new
    end

    guessed_answer = 0

    loop do
      if computer
        guessed_answer = computer.guess  
      else
        guessed_answer = prompt 
      end

      status = condition(guessed_answer)
      
      if computer 
        computer.change_answer(status)
      end

      puts status

      @guesses += 1
      break if win?(guessed_answer)
    end
   

    puts "You win!"
  end

  private
  
  attr_reader :answer

  def win?(n)
    answer == n
  end
  
  def condition(n)
    if n < answer
      "Too low!"
    elsif n > answer
      "Too high!"
    else 
      "It took you: #{@guesses} attempts to find the right number. Which was #{n}!"
    end
  end

  def prompt
    print "Enter a number: "
    gets.chomp.to_i
  end
end

Game.new('computer')
