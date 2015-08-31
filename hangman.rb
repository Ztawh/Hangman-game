puts "Lets play a game of hangman!"

available_words = ["schweiz", "jazz", "hwatz", "snabeldrake"]
word = available_words.shuffle.sample

word_arr = word.split(//)
letters = word_arr.count

puts "I have a word for you. It's #{letters} letters long. Guess what it is by typing it one letter at a time."

#puts letters

letter_in_arr = []
letters.times do
	letter_in_arr += ["_ "]
end

letter_in_arr.each do |element|
	print element
end

puts "\n"

letter_in = gets.chomp

def fail
	puts "GAME OVER!!"
end

def letter_check(letter_in, word_arr, letter_in_arr)
	tries_left = 0
	#while tries_left != 9
		if word_arr.include?(letter_in)
			letter_in_arr[word_arr.index(letter_in)] = letter_in
	
		#if word_arr.include?(letter_in)==false
		else
			tries_left += 1
		end
	#end

	if tries_left == 8
		fail()
	end


	letter_in_arr.each do |element|
		print element
	end
	puts "\n"
end
letter_check(letter_in, word_arr, letter_in_arr)


