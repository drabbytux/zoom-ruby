# Get My Number Game
# Edited by: David Little

puts "Welcome to 'Get My Number!'"

print "What's your name? "

input = gets
name = input.chomp
puts "Welcome, #{name}!"


# Store a random number for the player to guess.
puts "I've got a random number between 1 and 100."
puts "Can you guess it?"
target = rand(100) + 1

# track how many guesses the player has made.
num_guesses = 0

# Track whether the player has guessed correctly.
guessed_it = false

puts "You've got #{10 - num_guesses} guesses left."
print "Make a guess: "
guess = gets.to_i


# Compare the guess to the target.
# Print the appropriate message
if guess < target
    puts "Ooops! your guess was LOW."
elsif guess > target
  puts "Ooops! Your guess was too damn HIGH."
elsif guess == target 
  puts "Good Job, #{name}!"
  puts "You guess the number if #{num_guesses} guesses!"
  guessed_it = true
end

# if player ran out of turns, tell them what the number was.
if not guessed_it
  puts "Sorry. You didn't get the number (it was #{target})."
end