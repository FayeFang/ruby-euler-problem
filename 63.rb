puts 10 ** ( 10.to_f / 11)

result = 0
x = 1
n = 1

while x < 10 do
	number_of_answers = (1.to_f / (1.to_f - Math.log10(x))).floor
	result += number_of_answers
	x += 1
end

puts result
