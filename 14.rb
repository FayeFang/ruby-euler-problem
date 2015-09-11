sequence_length = 0
starting_number = 0
length = 0


(1..1000000).each do |a|
	number = a
	length = 1
	while a != 1
		if a.even?
			a = a / 2 
		else
			a = 3 * a + 1
		end
		length += 1
    end

    if length > sequence_length
    	sequence_length = length
    	starting_number = number
    end
end

puts starting_number, sequence_length