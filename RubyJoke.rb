# Created by Cameron Jordan

# Represents the console window ------------
class Screen
    def cls #Define a method that clears the display area
        puts ("\n" * 25)
    end
end

# ------------ Main ------------

Console_Screen = Screen.new
Console_Screen.cls

puts "Would you like to hear a few funny jokes? (y/n)"
answer = STDIN.gets
answer.chop!

if answer == "n"
    Console_Screen.cls
    puts "Sorry to hear that. Please return and play again soon."
else
    Console_Screen.cls
    puts "What is black and white and red all over? (Press Enter)"
    pause = STDIN.gets
    puts "A messy penguin eating cherry pie! (Press Enter)"
    pause = STDIN.gets

    Console_Screen.cls
    puts "What is black and white and red all over? (Press Enter)"
    pause = STDIN.gets
    puts "A sunburned penguin! (Press Enter)"
    pause = STDIN.gets

    Console_Screen.cls
    puts "What is black and white and red all over? (Press Enter)"
    pause = STDIN.gets
    puts "An embarrassed Dalmatian puppy! (Press Enter)"
    pause = STDIN.gets

    Console_Screen.cls
    puts "What is black and white and red all over? (Press Enter)"
    pause = STDIN.gets
    puts "A zebra with a scratched knee! (Press Enter)"
    pause = STDIN.gets

    Console_Screen.cls
    puts "What is black and white and red all over? (Press Enter)"
    pause = STDIN.gets
    puts "A skunk with diaper rash! (Press Enter)"
    pause = STDIN.gets

    Console_Screen.cls
    puts "Thanks for playing the Ruby Joke game!"
end