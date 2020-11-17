# Problem 5, Mastermind
#
# David Little
# Oct 13 2020

@guesses = 0

def playMasterMind(code)
  
  print "Enter your guess:"
  guess = gets.chomp
  @guesses += 1
  feedback_correct = ""
  feedback_included = ""
  if guess =~ /\A\d+\z/

    # They guessed it correctly, send them back right away
    if guess.to_i == code
      puts "Nice work! You took #{@guesses} guesses."
      return false
    end

    # Not exact match. Give them hints
    code.to_s.split('').each_with_index do |n, key| 
      if n == guess.slice(key)
        feedback_correct +=  'X'
      elsif guess.include? n
        feedback_correct +=  'x'
      end
    end
    puts feedback_correct + feedback_included
  end
  return true
end

def generateRandom
  sreturn = ""
  x=1
  while x <= 4
    sreturn += rand(1..6).to_s
    x += 1
  end
  return sreturn.to_i
end

# Game Play
code = generateRandom()
puts code
gameplay = true
while gameplay
  gameplay = playMasterMind(code)
end