=begin
  Requires:
  variables, data types, and numerical operators
  basic input/output
  logic (if statements, switch statements)

  Write a program that presents the user w/ a choice of your 5 favorite beverages (Coke, Water, Sprite, ... , Whatever).
  Then allow the user to choose a beverage by entering a number 1-5.
  Output which beverage they chose.

  ★ If you program uses if statements instead of a switch statement, modify it to use a switch statement.
  If instead your program uses a switch statement, modify it to use if/else-if statements.

  ★★ Modify the program so that if the user enters a choice other than 1-5 then it will output "Error. choice was not valid, here is your money back."
=end

class VendingMachine

  def initialize
    @drinks = {
      1 => "Coke",
      2 => "Sprite",
      3 => "Water",
      4 => "Dr.Pepper",
      5 => "Fanta",
    }
  end

  def get_drink
    prompt
    if drinks.include?(@drink)
      puts drinks[@drink]
    else
      puts "We do not offer this drink."
    end
  end

  def add_drinks(additional_drinks)
    drinks.merge!(additional_drinks)
  end

  private
  attr_accessor :drinks

  def prompt
    puts "What drink do you want?"
    @drink = gets.chomp.to_i
  end
end

a = VendingMachine.new
new_drinks = { 6 => "Tea", 7 => "RedBull" }
a.add_drinks(new_drinks)
a.get_drink
