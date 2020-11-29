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

# Displays the typing test ------------ ------------ ------------
class Test
    # Shows greeting message
    def display_greeting
        Console_screen.cls
        print "\t\t  Welcome to the Ruby Typing Challenge game!" + "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " + "continue. \n\n: "
        Console_screen.pause
    end

    # Shows the instructions
    def display_instructions
        Console_screen.cls
        puts "\t\t\tInstructions:\n\n"
        puts %Q{    This test consists of a series of 5 typing challenges. 
            The challenge sentences are displayed one at a time. To respond 
            correctly, you must retype each sentence exactly as shown and press 
            the Enter key. Your grade will be displayed at the end of the test.
            \n\n\n\n\n\n\n\n\n
            Press Enter to continue.\n\n}
        Console_screen.pause
    end

    # Shows typing challenges
    def display_test(challenge)
        Console_screen.cls
        print challenge + "\n\n: "
        result = STDIN.gets
        result.chop!

        if challenge == result then
            $noRight += 1
            Console_screen.cls
            print "Correct!\n\nPress Enter to continue." 
            Console_screen.pause
        
        else
            Console_screen.cls
            print "Incorrect!\n\nPress Enter to continue."
            Console_screen.pause
        end
    end

    # Shows test results
    def calculate_grade
        Console_screen.cls

        if $noRight >= 3 then
            print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
            puts "You have passed the typing test!\n\nPress Enter to continue."
        
        else
            print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
            puts "You have failed the typing test!\n\nPress Enter to continue."
        end
    end
end

# Main Script Logic ------------ ------------ ------------
$noRight = 0
Console_screen = Screen.new
Typing_test = Test.new

Typing_test.display_greeting
Console_screen.cls

print "Would you like to test your typing skills? (y/n)\n\n: "
answer = STDIN.gets
answer.chop!

# Loop until y or n inputted
until answer == "y" || answer == "n"
    Console_screen.cls
    print "Would you like to test your typing skills? (y/n)\n\n: "
    answer = STDIN.gets
    answer.chop!
end

# Analyze the response
if answer == "n"
    Console_screen.cls
    puts "Ok, maybe another time. \n\n"
    sleep(2.5)

else
    Typing_test.display_instructions
    
    Typing_test.display_test "In the end there can be only one."
    Typing_test.display_test "Once a great plague swept across the land."
    Typing_test.display_test "Welcome to Ruby Principles of Ruby Programming"
    Typing_test.display_test "There are very few problems in the world " +
    "that enough M&Ms cannot fix."
    Typing_test.display_test "Perhaps today is a good day to die. Fight " +
    "beside me and let us die together."

    Typing_test.calculate_grade
    Console_screen.pause
    Console_screen.cls
    puts "Thank you for taking the Ruby Typing Challenge.\n\n"
    sleep(2.5)
end