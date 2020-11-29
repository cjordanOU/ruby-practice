# Created by Cameron Jordan

# Displays the console window ------------ ------------ ------------
class Screen
    # Clears screen
    def cls
        puts ("\n" * 25)
        puts "\a"
    end

    # Pauses the screen when called
    def pause
        STDIN.gets
      end
end

# Displays the trivia quiz ------------ ------------ ------------
class Test
    # Shows greeting message
    def display_greeting
        Console_screen.cls
        print "\t\t  Welcome to the Superman Movie Trivia Quiz!" + "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " + "continue. \n\n: "
        Console_screen.pause
    end

    # Shows the instructions
    def display_instructions
        Console_screen.cls
        puts "You will be presented with a series of multiple-choice" 
        puts "questions. To answer a question, type in the letter of"
        puts "the corresponding answer and press the Enter key. Your"
        puts "grade will be displayed at the end of the test.\n\n\n"
        puts "Good luck!\n\n\n\n\n\n\n\n\n"
        print "Press Enter to continue."
        Console_screen.pause
    end

    # Defines method to show and process quiz questions
    def display_question(question, q_A, q_B, q_C, q_D, answer)
        loop do
            Console_screen.cls
            puts question + "\n\n"
            puts q_A
            puts q_B
            puts q_C
            puts q_D
            print "\nType the letter representing your answer: "

            reply = STDIN.gets
            reply.chop!

            # Check if answer is correct
            if answer == reply then
                $noRight += 1
            end

            # Makes sure the answer was a valid input
            if reply == "a" or reply == "b" or reply == "c" or reply == "d" then
                break
            end
        end
    end

    # Defines method that checks test results and shows them to the user
    def calculate_grade
        Console_screen.cls

        if $noRight >= 3 then
            print "You correctly answered " + $noRight.to_s + " question(s). "
            puts "You have passed the \nSuperman Movie Trivia Quiz!\n\n"
            puts "You have earned a rank of: Good Citizen" if $noRight == 3
            puts "You have earned a rank of: Side Kick" if $noRight == 4
            puts "You have earned a rank of: Superhero" if $noRight == 5
            print "\n\nPress Enter to continue."
        
        else
            print "You missed " + (5 - $noRight).to_s + " questions. "
            puts "You have failed the Superman Movie Trivia Quiz."
            puts "Perhaps you should watch the movies again before returning to"
            puts "retake the quiz."
            print "\n\nPress Enter to continue."
        end

        Console_screen.pause
    end

    # Shows the credits of the program
    def show_credits
        Console_screen.cls
        puts "\t\tThank you for taking the Superman Movie Trivia Quiz.\n\n\n\n"
        puts "\n\t\t\t Developed by Cameron Jordan\n\n"
        puts "\t\t\t\t  Copyright 2020\n\n"
    end

end

# Main Script Logic ------------ ------------ ------------
$noRight = 0
Console_screen = Screen.new
supermanQuiz = Test.new
answer = ""

supermanQuiz.display_greeting

# Loops until the player answers y or n
loop do
    Console_screen.cls
    print "Are you ready to take the quiz? (y/n): "
    answer = STDIN.gets
    answer.chop!
    break if answer == "y" || answer == "n"
end

if answer == "n"
    Console_screen.cls
    puts "Ok, maybe another time. \n\n"
    sleep(2.5)

else
    supermanQuiz.display_instructions
    supermanQuiz.display_question("What is the name of the Daily Planet's ace photographer?","a. Jimmy Olsen", "b. Clark Kent", "c. Lex Luthor", "d. Lois Lane", "a")
    supermanQuiz.display_question("What is the name of Clark Kent's home town?","a. Metropolis", "b. Gotham City", "c. Smallville", "d. New York", "c")
    supermanQuiz.display_question("In which movie did Superman battle General Zod?","a. Superman", "b. Superman II", "c. Superman III", "d. Superman IV", "b")
    supermanQuiz.display_question("What is the name of Superman's father?","a. Nimo", "b. Jarrell", "c. Lex Luthor", "d. Krypton", "b")
    supermanQuiz.display_question("Where had Superman been at the start of 'Superman Returns'?","a. Moon", "b. Fortress of Solitude", "c. Earth's Core", "d. Krypton", "d")

    supermanQuiz.calculate_grade
    supermanQuiz.show_credits
    sleep(5)
end