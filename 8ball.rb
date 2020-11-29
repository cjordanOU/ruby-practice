# Created by Cameron Jordan

# Represents the console window ------------ ------------ ------------
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

# Represents the 8ball ------------ ------------ ------------
class Ball
    # Class Properties
    attr_accessor :randomNo, :greeting, :question, :goodbye

    # Method that generates random answers
    def get_fortune
        randomNo = 1 + rand(6)

        # Use random numbers to give answer
        case randomNo
        when 1
            $prediction = "yes"
        when 2
            $prediction = "no"
        when 3
            $prediciton = "maybe"
        when 4
            $prediction = "hard to tell. Try again"
          when 5
            $prediction = "unlikely"
          when 6
            $prediction = "unknown"
        end
    end

    # Shows greeting message
    def say_greeting
        greeting = "\t\t  Welcome to the Virtual Crazy 8-Ball game!" + "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " + "continue. \n\n: "
        print greeting
    end

    # Primary Query
    def get_question
        question = "Type your question and press the Enter key. \n\n: "
        print question
    end

    # Shows the answer
    def tell_fortune()
        print "The answer is " + $prediction + ". \n\n: "
    end

    # Shows the goodbye message
    def say_goodbye
        goodbye = "Thanks for playing the Virtual Crazy 8-Ball game!\n\n"
        puts goodbye
    end

end

# Main Script Logic ------------ ------------ ------------
Console_screen = Screen.new
Eight_ball = Ball.new

Console_screen.cls
Eight_ball.say_greeting
Console_screen.pause

answer = ""

# Loop until player enters either y or n
until answer == "y" || answer == "n"
    Console_screen.cls
    print "Would you like to have your fortune predicted? (y/n)\n\n: "
    answer = STDIN.gets
    answer.chop!
end

# Respond to the response given
if answer == "n"
    Console_screen.cls
    puts "Ok, maybe another time. \n\n"
    sleep(2.5)

else
    gameOver = "No"

    # Loop until player quits
    until gameOver == "Yes"
        Console_screen.cls
        Eight_ball.get_question
        Eight_ball.get_fortune
        Console_screen.pause

        Console_screen.cls
        Eight_ball.tell_fortune
        Console_screen.pause

        Console_screen.cls
        print "Press Enter to ask another question or type q to quit. \n\n: "
        answer = STDIN.gets
        answer.chop!

        if answer == "q"
            gameOver = "Yes"
        end

    end
    
    Console_screen.cls
    Eight_ball.say_goodbye
    sleep(2.5)

end