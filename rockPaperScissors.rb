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

# Displays the rock paper scissors game ------------ ------------ ------------
class Game
    # Shows greeting message
    def show_greeting
        Console_screen.cls
        print "\t\t\tLet's Play Rock, Paper, Scissors!\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to continue. "
        Console_screen.pause
    end

    # Shows the instructions
    def show_instructions
        Console_screen.cls
        puts "INSTRUCTIONS:\n\n"

        puts "This game pits the player against the computer. To play, you must"
        puts "enter one of the following moves when prompted: Rock, Paper, or"
        puts "Scissors.\n\n"
        puts "The game will randomly select a move for the computer, and "
        puts "the two moves will then be analyzed according to the following"
        puts "rules: \n\n"
        puts "* Rock crushes Scissors, Rock equals Rock, and Rock is covered by"
        puts "  Paper.\n\n"
        puts "* Paper covers Rock, Paper equals Paper, and Paper is cut by"
        puts "  Scissors.\n\n"
        puts "* Scissors cut Paper, Scissors equals Scissors, and Scissors are"
        puts "  crushed by Rock.\n\n\n"
        puts "Good luck!\n\n\n"
        print "Press Enter to continue. "
        Console_screen.pause
    end

    # Controls the Gameplay
    def play_game
        playerMove = get_player_move
        computerMove = get_computer_move

        result = analyze_results(playerMove, computerMove)
        show_results(playerMove, computerMove, result)
    end

    # Collects the player's move
    def get_player_move
        Console_screen.cls

        loop do
            Console_screen.cls
            puts "To make a move, type one of the following and press Enter:\n\n"
            print "[Rock] [Paper] [Scissors]: "

            @choice = STDIN.gets
            @choice.chop!

            break if @choice  =~ /Rock|Paper|Scissors/i 
        end

        # Makes move always uppercase and returns it to the calling statement
        return @choice.upcase
    end

    # Generates the computer's move
    def get_computer_move
        moves = ["ROCK", "PAPER", "SCISSORS"]
        randomNo = rand(3)
        return moves[randomNo]  
    end

    # Analyzes the player and computer results
    def analyze_results(player, computer)

        # Player choses ROCK
        if player == "ROCK" then
            return "Player wins!" if computer == "SCISSORS"
            return "Tie!" if computer == "ROCK"     
            return "Computer wins!" if computer == "PAPER" 
        end

        # Player choses PAPER
        if player == "PAPER" then
            return "Player wins!" if computer == "ROCK"
            return "Tie!" if computer == "PAPER"     
            return "Computer wins!" if computer == "SCISSORS" 
        end

        # Player choses SCISSORS
        if player == "SCISSORS" then
            return "Player wins!" if computer == "PAPER"
            return "Tie!" if computer == "SCISSORS"     
            return "Computer wins!" if computer == "ROCK" 
        end
    end

    # Shows the results of the game
    def show_results(player, computer, result)

        Console_screen.cls
        puts "\n\n\t\t\tRESULTS:"
        puts "\n\n\t\t\t================================"
        puts "\n\n\t\t\tPlayer's move:    " + player
        puts "\n\n\t\t\tComputer's move:  " + computer
        puts "\n\n\t\t\tResult:           " + result
        puts "\n\n\t\t\t================================"
        puts "\n\n\n\n"
        print "Press Enter to continue. "
        Console_screen.pause
    end

    # Shows the credits
    def show_credits
        Console_screen.cls
        puts "\t\tThank you for playing the Rock Paper Scissors game!\n\n\n\n"
        puts "\n\t\t\t Developed by Cameron Jordan\n\n"
        puts "\t\t\t\t November 2020\n\n"
    end
end

# Main Script Logic ------------ ------------ ------------
Console_screen = Screen.new
RPS = Game.new  

RPS.show_greeting
answer = ""

loop do
    Console_screen.cls
    print "Are you ready to play the Rock Paper Scissors? (y/n): "
    answer = STDIN.gets
    answer.chop!

    break if answer =~ /y|n/i
end

if answer =~ /n/i
    Console_screen.cls
    puts "Okay, perhaps another time.\n\n"
    sleep(5)
else
    RPS.show_instructions
    playAgain = ""

    loop do
        RPS.play_game
        loop do
            print "Would you like to play again? (y/n): "
            playAgain = STDIN.gets
            playAgain.chop!

            break if playAgain =~ /n|y/i
        end

        break if playAgain =~ /n/i
    end

    RPS.show_credits
    sleep(5)
end