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

# Displays the blackjack game ------------ ------------ ------------
class Game
    # Shows greeting message
    def show_greeting
        Console_screen.cls
        print "\t\t\tWelcome to the Ruby Blackjack Game!\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to continue. "
        Console_screen.pause
    end

    # Shows the instructions
    def show_instructions
        Console_screen.cls
        puts "INSTRUCTIONS:\n\n"

        puts "This game is based on the Blackjack card game, where the"
        puts "objective is to beat the dealer by acquiring cards that total"
        puts "higher than the dealer's cards without going over 21. In this"
        puts "version, the player and dealer are each dealt an initial card. The"
        puts "player is then prompted to draw additional cards. The player"
        puts "may draw as many additional cards as desired, as long as the"
        puts "player's hand adds up to less than 21. If the player's hand goes"
        puts "over 21, the player busts and the dealer automatically"
        puts "wins. Once the player decides to hold, it is the dealer's"
        puts "turn. The dealer continues to add new cards to his hand"
        puts "until it adds up to 17 or more or the dealer busts. Once the"
        puts "dealer's hand is complete, the game analyzes the player's hand"
        puts "and the dealer's hand to determine the results of the game."
        puts "\n\n\n\n\n\n\n"
        print "Press Enter to continue. "
        Console_screen.pause
    end

    # Controls the Gameplay
    def play_game
        Console_screen.cls
        playerHand = get_new_card
        dealerHand = get_new_card
        playerHand = complete_player_hand(playerHand, dealerHand)

        if playerHand <= 21 then
            dealerHand = play_dealer_hand(dealerHand)
        end
        
        determine_winner(playerHand, dealerHand)
    end

    # Deals new card
    def get_new_card
        card = 1 + rand(13)

        # Ace card logic
        return 11 if card == 1 

        # Face card logic
        return 10 if card >= 10

        return card
    end

    def complete_player_hand(playerHand, dealerHand)
        loop do
            Console_screen.cls

            puts "Player's hand: " + playerHand.to_s + "\n\n"
            puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n\n"
            print "Would you like another card? (Y/N) "

            reply = STDIN.gets
            reply.chop!

            # Checks if the player wants another card
            if reply =~ /y/i then
                playerHand = playerHand + get_new_card
            end

            # Checks if the player is staying with their current hand
            if reply =~ /n/i then
                break
            end

            if playerHand > 21 then
                break
            end
        end

        # Return the value of the player's hand
        return playerHand
    end

    # Manages the dealer's hand
    def play_dealer_hand(dealerHand)
        loop do
            if dealerHand < 17 then
                dealerHand = dealerHand + get_new_card
            else
                break
            end
        end

        # Return the value of the dealer's hand
        return dealerHand
    end

    def determine_winner(playerHand, dealerHand)
        Console_screen.cls
        
        puts "Player's hand: " + playerHand.to_s + "\n\n"
        puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n\n"

        if playerHand > 21 then # Check if player busts
            puts "You have gone bust!\n\n"
            print "Press Enter to continue."
        else  # Player and dealer tie
            if playerHand == dealerHand then
                puts "Tie!\n\n"
                print "Press Enter to continue."
              end
            # Checks if dealer busts
            if dealerHand > 21 then
                puts "The Dealer has gone bust!\n\n"
                print "Press Enter to continue."
            else
                # Check if the player's hand beats the dealer's
                if playerHand > dealerHand then
                    puts "You have won!\n\n"
                    print "Press Enter to continue."
                end
                # See if the dealer's hand beats the player's
                if playerHand < dealerHand then
                    puts "The Dealer has won!\n\n"
                    print "Press Enter to continue."
                end
            end  
        end

        Console_screen.pause
    end

    # Shows the credits
    def show_credits
        Console_screen.cls
        puts "\t\tThank you for playing the Ruby Blackjack game.\n\n\n\n"
        puts "\n\t\t\t Developed by Cameron Jordan\n\n"
        puts "\t\t\t\t November 2020\n\n"
    end
end

# Main Script Logic ------------ ------------ ------------
Console_screen = Screen.new
blackJackGame = Game.new

blackJackGame.show_greeting
answer = ""

loop do
    Console_screen.cls
    print "Are you ready to play Ruby Blackjack? (y/n): "
    answer = STDIN.gets
    answer.chop!

    break if answer =~ /y|n/i
end

if answer =~ /n/i
    Console_screen.cls
    puts "Okay, perhaps another time.\n\n"
    sleep(5)
else
    blackJackGame.show_instructions
    playAgain = ""

    loop do
        blackJackGame.play_game
        loop do
            print "Would you like to play another hand? (y/n): "
            playAgain = STDIN.gets
            playAgain.chop!

            break if playAgain =~ /n|y/i
        end

        break if playAgain =~ /n/i
    end

    blackJackGame.show_credits
    sleep(5)
end