#!/usr/bin/ruby
# Question 1: Print out the ubiquitous “Hello, World” message.
puts "Question 1: "
puts "Hello, World"

# Question 2: For the string “Hello, World,” find and print the index of the word “World”.
puts "Question 2: "
puts "Hello, World".index("World")

# Question 3: Print the string “This is funny monkey #1!” where the number 1 changes from 1 to 10.  Implement this in 3 different ways using Ruby.
# 1st way to increment
puts "Question 3: "
puts "1st way: \n"
n = 1
while n < 11
    puts "This is funny monkey ##{n}!"
    n += 1
end

# 2nd way to increment
puts "2nd way: \n"
n = 1
until n > 10 do
    puts "This is funny monkey ##{n}!"
    n += 1
end

# 3rd way to increment
puts "3rd way: \n"
for n in 1..10
    puts "This is funny monkey ##{n}!"
end

# Question 4: Write a simple game that generates a random number 1 – 1000.  Let a player guess the number.  If the guess is wrong print out whether the guess is low or high and let the player guess again.  Repeat this until the user guesses the number.  Award the lucky user who finally gets it right, a surprise of their choice.   Hint: rand(1000) will generate a random number 0 .. 999.  The function gets will read a string from the keyboard that can be translated into an integer.
puts "Question 4: "
randomNumber = (rand(1000) + 1).to_i
puts "Guess a number from 1-1000: "
puts "Put 0 to give up!"
randomGuess = gets.to_i
result = false
while result == false
    if randomGuess == 0
        puts "Wow you suck you couldn't even guess the number!"
        puts "The random number was #{randomNumber}!"
        break
    end
    if randomGuess < randomNumber
        puts "lul number was too low, guess again!"
        randomGuess = gets.to_i
    else
        puts "lul number was too high, guess again!"
        randomGuess = gets.to_i
    end
    if randomGuess == randomNumber
        puts "You got the right number, what a genius!"
        result = true
    end
end

# Question 5: Given the following array definition in Ruby, generate a method named convert_to_type_strings that takes the array as input and returns a second array where each element in the array corresponds to a string representation of the type (e.g. class) of each element in the array. 
# data = ['hello', 0, :sym, 3.4, "world", true, [0..3]]
# e.g, the method should return the following array: ["String", "Fixnum", "Symbol", "Float", "String", "TrueClass", "Array"]
puts "Question 5: "
def convert_to_type_strings(array)
    type = Array.new
    array.each {
        |t| 
        type << t.class
    }
    return type
end
data = ['hello', 0, :sym, 3.4, "world", true, [0..3]]
puts convert_to_type_strings(data)

# Question 6: Augment the existing Array class in Ruby so that it has a method named convert_to_type_strings that does exactly what the method in question #5 above does but using the array’s internal data (e.g. you cannot pass the array as a parameter).   Hint: investigate the map method defined by Array.  When you are finished, test with the following code:
# data = ['hello', 0, :sym, 3.4, "world", true, [0..3]]
# data.convert_to_type_strings
# e.g. the call to convert_to_type_strings on the array should produce: 
# ["String", "Fixnum", "Symbol", "Float", "String", "TrueClass", "Array"]
puts "Question 6: "
class Array
    def convert_to_type_strings
        type = Array.new
        self.each {
            |t| 
            type << t.class
        }
        return type
    end
end
data = ['hello', 0, :sym, 3.4, "world", true, [0..3]]
puts data.convert_to_type_strings

# Question 7: Given an array of symbol values representing an ensemble, write a method called tabulate_sections that produces a hash that maps a string representation of the section (e.g. type) the instrument belongs to, to the number of instruments in that section of the ensemble.   For example, the input array:
# ensemble = [:piano, :clarinet, :oboe, :trumpet, :frenchhorn, :violin, :piano, :oboe, :cello]
# produces the output hash:
# {"percussion"=>2, "woodwind"=>3, "brass"=>2, "strings"=>2}
# You may assume that you only need to deal with the instrument and instrument types referenced in this example.
puts "Question 7: "
def tabulate_sections(array)
    instrumentType = {"percussion" => 0, "woodwind"=> 0, "brass"=> 0, "strings"=> 0}
    array.each {
        |t| 
        if t == :piano
            instrumentType["percussion"] += 1
        elsif t == :clarinet || t == :oboe
            instrumentType["woodwind"] += 1
        elsif t == :trumpet || t == :frenchhorn
            instrumentType["brass"] += 1
        elsif t == :violin || t == :cello
            instrumentType["strings"] += 1
        end
    }
    return instrumentType
end
ensemble = [:piano, :clarinet, :oboe, :trumpet, :frenchhorn, :violin, :piano, :oboe, :cello]
puts tabulate_sections(ensemble)