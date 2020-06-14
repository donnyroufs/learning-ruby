=begin
    Requires:
    variables, data types, and numerical operators
    basic input/output
    logic (if statements, switch statements)

    Write a program that allows the user to enter the grade scored in a programming class (0-100).
    If the user scored a 100 then notify the user that they got a perfect score.

    ★ Modify the program so that if the user scored a 90-100 it informs the user that they scored an A

    ★★ Modify the program so that it will notify the user of their letter grade
    0-59 F 60-69 D 70-79 C 80-89 B 90-100 A
=end

class Grader
  
  def check_grade
    ask_question
    puts calculate_grade   
  end 
  
  private

  def ask_question
    print "Enter grade: "
    @grade = gets.chomp
  end
  
  def calculate_grade
    case @grade.to_i
    when 90..100
      "A"
    when 80..89
      "B"
    when 70..79
      "C"
    when 60..69
      "D"
    when 0..59
      "F"
    else
      "Invalid input."
    end
  end
end

a = Grader.new
a.check_grade


# def ask_question
#   print "Enter grade: "
#   grade = gets.chomp
# end

# def calculate_grade(grade)
#   case grade.to_i
#   when 90..100
#     "A"
#   when 80..89
#     "B"
#   when 70..79
#     "C"
#   when 60..69
#     "D"
#   when 0..59
#     "F"
#   else
#     "Invalid input."
#   end
# end

# answer = ask_question
# grade = calculate_grade(answer)
# puts grade