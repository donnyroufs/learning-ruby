=begin
  Requires:
  variables, data types, and numerical operators
  basic input/output
  logic (if statements, switch statements)
  loops (for, while, do-while)
  arrays

  Write a program that asks the user to enter the number of pancakes eaten for breakfast by 10 different people (Person 1, Person 2, ..., Person 10)
  Once the data has been entered the program must analyze the data and output which person ate the most pancakes for breakfast.

  ★ Modify the program so that it also outputs which person ate the least number of pancakes for breakfast.

  ★★★★ Modify the program so that it outputs a list in order of number of pancakes eaten of all 10 people.
  i.e.
  Person 4: ate 10 pancakes
  Person 3: ate 7 pancakes
  Person 8: ate 4 pancakes
  ...
  Person 5: ate 0 pancakes
=end

class Breakfast
  @@people = Array.new

  def initialize
    create_people
    system("cls")
    scoreboard
  end

  private 

  def scoreboard
    @@people
      .sort_by(&:pancakes_eaten)
      .reverse
      .each do |person|
        puts "#{person.name} ate #{person.pancakes_eaten} pancakes."
      end

      additional_information
  end

  def prompt
    print "Name: "
    name = gets.chomp
    print "Pancakes eaten: "
    eaten = gets.chomp
    { "eaten" => eaten, "name" => name }
  end

  def create_people
    3.times do
      info = prompt
      @@people << Person.new(info["name"], info["eaten"])
    end
  end

  def additional_information
      puts "Most eaten: #{most.name} ate #{most.pancakes_eaten} pancakes"
      puts "Least eaten: #{least.name} ate #{least.pancakes_eaten} pancakes"
  end

  def most
    @@people.max_by(&:pancakes_eaten)
  end

  def least
    @@people.min_by(&:pancakes_eaten)
  end
end

class Person
  attr_accessor :name, :pancakes_eaten

  def initialize(name, pancakes_eaten)
    @name = name
    @pancakes_eaten = pancakes_eaten
  end
end

Breakfast.new
