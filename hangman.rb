puts "Lets play a game of hangman!"

available_words = ["schweiz", "jazz", "hwatz", "snabeldrake"]
word = available_words.shuffle.sample

word_arr = word.split(//)
letters = word_arr.count

puts "I have a word for you. It's #{letters} letters long. Guess what it is by typing it one letter at a time."

letter_in_arr = []
letters.times do
	letter_in_arr += ["_"]
end

letter_in_arr.each do |element|
	print element + " "
end

puts "\n \n"

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

#letter_in = gets.chomp
#letter_in = letter_in.downcase

def fail()
	puts "GAME OVER!!"
end

def win()
	puts "Congratulations, you got the word!!"
end

#def letter_check(word_arr, letter_in_arr)
	tries_left = 8

	puts "Available words: "
		alphabet.each do |element|
			print element + " "
		end
		puts "\n"

		guessed = []


	until tries_left == -1

		if letter_in_arr.sort == word_arr.sort
			win()
			break
		end

	

		letter_in = gets.chomp.downcase
		puts "\n"

		
		if alphabet.include?(letter_in) && word_arr.include?(letter_in) == false
			tries_left -= 1
			puts "Nope! That's not it. You have #{tries_left} tries left."
		end
		
		if guessed.include?(letter_in)
			puts "You have already tried that letter. Please type a letter from the available ones above."
		end

		puts "\n"

		guessed << letter_in
		
		if alphabet.include?(letter_in)
			alphabet.delete(letter_in)
			puts "Available words: "
			alphabet.each do |element|
				print element + " "
			end
			puts "\n"
			
		end

		#if word_arr.include?(letter_in)
		#	letter_in_arr[word_arr.index(letter_in)] = letter_in
		#end

		word_arr.each_with_index do |element, index|
			if word_arr[index] == letter_in
				letter_in_arr[index] = element
			end
		end

		letter_in_arr.each do |element|
			print element + " "
		end
		puts "\n \n"

		if tries_left == 0
			fail()
			break
		end

	end


	
#end
#letter_check(word_arr, letter_in_arr)

