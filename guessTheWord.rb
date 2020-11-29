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
class Game
    # Shows greeting message
    def show_greeting
        Console_screen.cls
        print "\t\t\tWelcome to the Word Guessing Game!" +"\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " + "continue."
        Console_screen.pause
    end

    # Shows the instructions
    def show_instructions
        Console_screen.cls
        puts "At the start of each round of play, the game randomly selects"
        puts "a word that is between five and ten characters long and"
        puts "challenges you to guess it. Before submitting your guess, you"
        puts "must specify five consonants and one vowel. If any of these"
        puts "are used in the word, they will be revealed on the screen,"
        puts "thereby making it easier for you to guess the secret word.\n\n"
        puts "Good luck!\n\n\n\n\n\n\n\n\n"
        print "Press Enter to continue."
        Console_screen.pause
    end

    # Generates the Word used for the game
    def get_word
        # Array containing the words used in the game
        words = ["W I N D O W", "S T A T I O N", "H A M B U R G E R",
                "E X P R E S S I O N", "W A L L E T", "C A M E R A",
                "A I R P L A N E", "C A N D L E", "C O M P U T E R",
                "P I C T U R E", "F R A M E", "S H E L F", "B O W L I N G",
                "P O L I T E", "S T A T E M E N T", "N E G A T I V E",
                "M E T H O D", "F I S H I N G", "C O M P E N S A T E",
                "H A P P Y"]
            
        # Choses a random number between 0 and 19 which will be used to select which word will be used in the game
        randomNo = rand(19)

        # Returns the word selected by the random number chosen above
        return words[randomNo]
    end

    def get_consonants
        list = Array.new

        # Gives the player a hint of what is to come
        puts "Before you try to guess the secret word, you must specify " + "5 consonants.\n\n"
        print "Press Enter to continue."
        Console_screen.pause

        # Iterates the following code 5 times
        5.times do
            Console_screen.cls
            print "\nPlease enter a consonant and press Enter. "
            input = STDIN.gets
            input.chop!

            # Makes sure that consonant has been entered
            if input !~ /[bcdfghjklmnpqrstvwxyz]/i then
                Console_screen.cls
                print "Error: " + input + " is not a consonant. Press Enter to " + "continue."
                Console_screen.pause
                redo
            end

            # Makes sure only 1 character has been entered
            if input.length > 1 then
                Console_screen.cls
                print "Error: You may only enter one character at a time. Press " + "Enter to continue."
                Console_screen.pause
                redo
            end

            # Makes sure the same thing isn't inputted more than once
            if list.include?(input.upcase) == true then
                Console_screen.cls
                print "Error: You have already guessed " + input + ". Press " + "Enter to continue."
                Console_screen.pause
                redo
            else
                list.push(input.upcase)
            end
        end

        return list
    
    end

    def get_vowel
        puts "Before you try to guess the secret word, you must specify " + "1 vowel.\n\n"
        1.times do
            Console_screen.cls

            print "\nPlease enter a vowel and press Enter. "
            input = STDIN.gets
            input.chop!

            if input !~ /[aeiou]/i then
                Console_screen.cls
                print "Error: " + input + " is not a vowel. Press Enter to " + "continue."
                Console_screen.pause
                redo
            end

            if input.length > 1 then
                Console_screen.cls
                print "Error: You may only enter one character at a time. Press " + "Enter to continue."
                Console_screen.pause
                redo
            end

            input = input.upcase
            return input

        end
    end

    def prompt_guess(shortWord, word, consonants, vowel)
        Console_screen.cls

        consonants.push(vowel)
        wordArray = word.split(" ")

        i = 0

        wordArray.each do |letter|
            match = false

            consonants.each do |character|
                if character == letter then
                    match = true
                    break
                end
            end

            if match == false then
                wordArray[i] = "_"
            end

            i = i + 1
        end

        word = wordArray.join(" ")
        3.times do |i|
            Console_screen.cls
            puts "I am thinking of a word.\n\n\n\n\n\n"
            print "Here is your clue:  " + word + "\n\n\n\n\n\n\n\n"
            print "What do you think this word is?  "
            reply = STDIN.gets
            reply.chop!
            reply = reply.upcase

            if reply == shortWord then
                Console_screen.cls
                print "Correct! Press Enter to continue."
                Console_screen.pause
                break
            
            else
                Console_screen.cls
                if i == 1 then 
                    print "Wrong! You have one guess left. Press Enter to " + "try again."
                elsif i == 2
                    print "Sorry, you lose.\n\n"
                    print "The word was " + shortWord + ". Press Enter to continue."
                else
                    print "Wrong! Press Enter to try again."
                end

                Console_screen.pause
            
            end
        end
    end

    # Controls the Gameplay
    def play_game
        word = get_word
        Console_screen.cls

        consonants = get_consonants
        Console_screen.cls

        vowel = get_vowel
        shortWord = word.gsub(" ", "")
        prompt_guess(shortWord, word, consonants, vowel)
        Console_screen.cls
    end

    # Shows the credits of the program
    def show_credits
        Console_screen.cls
        puts "\t\tThank you for playing the Word Guessing Game.\n\n\n\n"
        puts "\n\t\t\t Developed by Cameron Jordan\n\n"
        puts "\t\t\t\t  Copyright 2020\n\n"
    end
end

# Main Script Logic ------------ ------------ ------------
Console_screen = Screen.new
guessTheWord = Game.new

guessTheWord.show_greeting
answer = ""

loop do
    Console_screen.cls
    print "Are you ready to play the Word Guessing Game? (y/n): "
    answer = STDIN.gets
    answer.chop!

    break if answer =~ /y|n/i
end

if answer == "n" or answer == "N"
    Console_screen.cls
    puts "Okay, perhaps another time.\n\n"

else
    guessTheWord.show_instructions

    loop do
        guessTheWord.play_game
        print "Enter Q to quit or press any key to play again: "
        playAgain = STDIN.gets
        playAgain.chop!

        break if playAgain =~ /Q/i
    end

    guessTheWord.show_credits
    sleep(5)
end