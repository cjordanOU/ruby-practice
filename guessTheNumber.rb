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

# Class for the Number Guessing Game ------------ ------------ ------------
class Game
    # Shows greeting message
    def display_greeting
        Console_screen.cls
        print "\t\t  Welcome to the Ruby Number Guessing Game!" + "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " + "continue. \n\n: "
        Console_screen.pause
    end

    # Shows the instructions
    def display_instructions
        Console_screen.cls
        puts "This game randomly generates a number from 1 to 100 and" 
        puts "challenges you to identify it in as few guesses as possible."
        puts "After each guess, the game will analyze your input and provide"
        puts "you with feedback. You may take as many turns as you need in" 
        puts "order to guess the game's secret number.\n\n\n"
        puts "Good luck!\n\n\n\n\n\n\n\n\n"
        print "Press Enter to continue."
        Console_screen.pause
    end

    # Generates a random number
    def generate_number
        return randomNumber = 1 + rand(100)
    end

    # Runs the Game
    def run_game
        number = generate_number

        loop do
            Console_screen.cls
            print "\nEnter your guess and press the Enter key: "
            reply = STDIN.gets
            reply.chop!
            reply = reply.to_i
        

            # Makes sure the number entered is between 1 and 100
            if reply < 1 or reply > 100 then
                redo
            end

            # Checks the players answer
            if reply == number then
                Console_screen.cls
                print "You have guessed the number! Press enter to continue."
                Console_screen.pause 
                break
            elsif reply < number then
                Console_screen.cls
                print "Your guess is too low! Press Enter to continue."
                Console_screen.pause
            elsif reply > number then
                Console_screen.cls
                print "Your guess is too high! Press Enter to continue."
                Console_screen.pause
            end
        end
    end

    # Shows the credits of the program
    def show_credits
        Console_screen.cls
        puts "\t\tThank you for playing the number guessing game.\n\n\n\n"
        puts "\n\t\t\t Developed by Cameron Jordan\n\n"
        puts "\t\t\t\t  Copyright 2020\n\n"
    end
end

# Main Script Logic ------------ ------------ ------------
Console_screen = Screen.new
guessingGame = Game.new
answer = ""

guessingGame.display_greeting

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
    guessingGame.display_instructions

    loop do
        guessingGame.run_game
        Console_screen.cls

        print "Would you like to play again? (y/n): "
        playAgain = STDIN.gets
        playAgain.chop!

        break if playAgain == "n"
    end

    guessingGame.show_credits
    sleep(5)
end