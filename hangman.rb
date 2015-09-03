def fail()
	puts "GAME OVER!! \n \n"
end

def win()
	puts "Congratulations, you got the word!! \n \n" 
end

available_words = ["schweiz", "jazz", "hwatz", "snabeldrake"]
word = available_words.shuffle.sample

word_arr = word.split(//)
letters = word_arr.count

puts "\n"
puts "Lets play a game of hangman! \nI have a word for you. It's #{letters} letters long. Guess what it is by typing it one letter at a time."
puts "\n"

letter_in_arr = []
letters.times do
	letter_in_arr += ["_"]
end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

tries_left = 8

puts "Available words: "
alphabet.each do |element|
	print element + " "
end
puts "\n \n"

letter_in_arr.each do |element|
	print element + " "
end

puts "\n \n"

guessed = []

until tries_left == -1

	if letter_in_arr.sort == word_arr.sort
		win()
		break
	end

	if tries_left == 0
		fail()
		break
	end

	letter_in = gets.chomp.downcase
	puts "\n"

	unless letter_in.to_i == 0
		puts "Please enter a letter!!"
		letter_in = gets.chomp.downcase
		puts "\n"
	end

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

	word_arr.each_with_index do |element, index|
		if word_arr[index] == letter_in
			letter_in_arr[index] = element
		end
	end

	letter_in_arr.each do |element|
		print element + " "
	end
	puts "\n \n"

end

