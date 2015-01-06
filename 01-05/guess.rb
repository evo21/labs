number = rand(100)
guess = ""

puts "Guess a number between 0 and 100"

while number != guess do

	guess = gets.to_i
	
	if guess > number then
		puts "#{guess} is too high.  Try again."
	elsif guess < number then
		puts "#{guess} is too low.  Try again."
	end
end

puts "Good job, you guessed it.  The number is #{number}."
	