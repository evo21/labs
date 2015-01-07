require 'pry'

alphabet = {"a" => "Alfa", "b" => "Bravo", "c" => "Charlie", "d" => "Delta", "e" => "Echo", "f" => "Foxtrot", "g" => "Golf", "h" => "Hotel", "i" => "Indigo", "j" => "Juliett", "k" => "Kilo", "l" => "Lima", "m" => "Mike", "n" => "November", "o" => "Oscar", "p" => "Papa", "q" => "Quebec", "r" => "Romeo", "s" => "Sierra", "t" => "Tango", "u" => "Uniform", "v" => "Victor", "w" => "Whiskey", "x" => "Xray", "y" => "Yankee", "z" => "Zulu"}

nato = alphabet.invert

def encoder (msg, encoder_hash)

	msg.downcase.each_char do |char|
		puts encoder_hash[char], " "
	end
end

def decoder (msg, decoder_hash)
	# when msg is passed to decoder, it is a long string like this "Alpha Whiskey Bravo"
	# calling the split method on any string will return an array of elements in the string (split by space by default)
	 mykeys = msg.split
	 # now we need to have a loop to pass each element of mykeys to the decoder_hash and print out the result
	 mykeys.each do |x|

	 	print decoder_hash[x.downcase.capitalize]
	 end
	
end

print "Input your Test Message to use with the Nato Encoder: "

to_encode = gets.chomp

encoder(to_encode, alphabet)

print "Now, pretend that you're in the army and spell-out a word using the Nato word-alphabet: "

to_decode = gets.chomp

decoder(to_decode, nato)
