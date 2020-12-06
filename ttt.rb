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
        puts "\t\t\tWelcome to the Ruby Tic-Tac-Toe Game!\n\n\n\n"
        puts "\t\t\t              |       |"
        puts "\t\t\t          X   |       |"
        puts "\t\t\t              |       |"
        puts "\t\t\t        ---------------------"
        puts "\t\t\t              |       |"
        puts "\t\t\t          O   |   X   |   O"
        puts "\t\t\t              |       |"
        puts "\t\t\t        ---------------------"
        puts "\t\t\t              |       |"
        puts "\t\t\t              |       |   X"
        puts "\t\t\t              |       |"
        print "\n\n\n\n\nPress Enter to continue. "
        Console_screen.pause
    end

    # Shows the instructions
    def show_instructions
        Console_screen.cls
        puts "INSTRUCTIONS:\n\n"

        puts "In the Ruby Tic-Tac-Toe game, Player X and " +
            "Player O try to "
        puts "outmaneuver each other by placing three Xs or " +
        "Os in a row "
        puts "horizontally, vertically, or diagonally. " +
        "Player X goes first. "
        puts "The game ends when either player claims three " +
        "squares in a " 
        puts "row or when all nine squares have been claimed " +
        "without either "
        puts "player managing to claim three squares in a row."
        puts "\n\n\n\n\n\n\n\n\n\n\n"
        print "Press Enter to continue. "
        Console_screen.pause
    end

    # Shows the instructions
    def show_gameboard(player)
        move = ""

        loop do
            Console_screen.cls
            puts "\t\t\tWelcome to the Ruby Tic-Tac-Toe Game! " +
                "\n\n\n\n"
            puts "\t\t\t          1       2       3\n" 
            puts "\t\t\t              |       |"
            puts "\t\t\t     A    #{$A1}   |   #{$A2}   |   #{$A3}"
            puts "\t\t\t              |       |"
            puts "\t\t\t        ---------------------"
            puts "\t\t\t              |       |"
            puts "\t\t\t     B    #{$B1}   |   #{$B2}   |   #{$B3}"
            puts "\t\t\t              |       |"
            puts "\t\t\t        ---------------------"
            puts "\t\t\t              |       |"
            puts "\t\t\t     C    #{$C1}   |   #{$C2}   |   #{$C3}"
            puts "\t\t\t              |       |"
        
            print "\n\n\n\n\nPlayer " + player + "'s turn. " +
                "Please enter your move: "
            
            move = STDIN.gets
            move.chop!
            move = move.upcase

            # Validate input
            if move.length == 2 then
                if move =~ /[A-C][1-3]/i
                    validMove = validate_move(move)
                    if validMove == true
                        break
                    end
                end
            end

        end

        return move
    end

    # Checks to see if the selected square is available
    def validate_move(move)
        # If square is taken
        return false if move == "A1" && $A1 != " "
        return false if move == "B1" && $B1 != " "
        return false if move == "C1" && $C1 != " "
        return false if move == "A2" && $A2 != " "
        return false if move == "B2" && $B2 != " "
        return false if move == "C2" && $C2 != " "
        return false if move == "A3" && $A3 != " "
        return false if move == "B3" && $B3 != " "
        return false if move == "C3" && $C3 != " "

        # If square is empty
        return true
    end

    # Controls the Gameplay
    def play_game
        player = "X"
        numOfMoves = 0
        clear_board

        loop do
            Console_screen.cls
            square = show_gameboard(player)

            $A1 = player if square == "A1" 
            $A2 = player if square == "A2" 
            $A3 = player if square == "A3" 
            $B1 = player if square == "B1" 
            $B2 = player if square == "B2" 
            $B3 = player if square == "B3" 
            $C1 = player if square == "C1" 
            $C2 = player if square == "C2" 
            $C3 = player if square == "C3" 

            numOfMoves += 1

            winner = check_results(player)

            if winner == "X" then
                show_results("Player X Wins!")
                break
            end

            if winner == "O" then
                show_results("Player O Wins!")
                break
            end

            if numOfMoves == 9 then
                show_results("Tie")
                break
            end

            # Switches player turns
            if player == "X" then
                player = "O"
            else
                player = "X"
            end
        end

    end

    # Collects the player's move
    def clear_board
        $A1 =  " "
        $A2 =  " "
        $A3 =  " "
        $B1 =  " "
        $B2 =  " "
        $B3 =  " "
        $C1 =  " "
        $C2 =  " "
        $C3 =  " "
    end

    # Analyzes the player and computer results
    def analyze_results(player)
        winner = ""

        # Check for tic-tac-toe vertically
        winner = player if $A1 == player && $A2 == player &&
            $A3 == player
        winner = player if $B1 == player && $B2 == player &&
            $B3 == player
        winner = player if $C1 == player && $C2 == player &&
            $C3 == player

        # Check for tic-tac-toe horizontally
        winner = player if $A1 == player && $B2 == player &&
            $C3 == player    
        winner = player if $A3 == player && $B2 == player &&
            $C1 == player 

        return winner
    end

    # Shows the results of the game
    def show_results(message)

        Console_screen.cls
        puts "\n\n\n"
        puts "\t\t\t     Game Over: " + message + "\n\n\n"
        puts "\t\t\t          1       2       3\n" 
        puts "\t\t\t              |       |"
        puts "\t\t\t     A    #{$A1}   |   #{$A2}   |   #{$A3}"
        puts "\t\t\t              |       |"
        puts "\t\t\t        ---------------------"
        puts "\t\t\t              |       |"
        puts "\t\t\t     B    #{$B1}   |   #{$B2}   |   #{$B3}"
        puts "\t\t\t              |       |"
        puts "\t\t\t        ---------------------"
        puts "\t\t\t              |       |"
        puts "\t\t\t     C    #{$C1}   |   #{$C2}   |   #{$C3}"
        puts "\t\t\t              |       |"
        print "\n\n\n\n\nPress Enter to continue. "
        Console_screen.pause
    end

    # Shows the credits
    def show_credits
        Console_screen.cls
        puts "\t\tThank you for playing the Ruby Tic-Tac-Toe game!\n\n\n\n"
        puts "\n\t\t\t Developed by Cameron Jordan\n\n"
        puts "\t\t\t\t December 2020\n\n"
    end
end

# Main Script Logic ------------ ------------ ------------
Console_screen = Screen.new
TTT = Game.new  

TTT.show_greeting
answer = ""
TTT.clear_board

loop do
    Console_screen.cls
    print "Are you ready to play Ruby Tic-Tac-Toe? (y/n): "
    answer = STDIN.gets
    answer.chop!

    break if answer =~ /y|n/i
end

if answer =~ /n/i
    Console_screen.cls
    puts "Okay, perhaps another time.\n\n"
    sleep(5)
else
    TTT.show_instructions
    playAgain = ""

    loop do
        TTT.play_game

        loop do
            Console_screen.cls
            playAgain = STDIN.gets
            playAgain.chop!

            break if playAgain =~ /n|y/i
        end

    playAgain =~ /n/i
    end

    TTT.show_credits
end