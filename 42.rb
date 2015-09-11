content = File.open(Dir.pwd, "words.txt","r+")

words = Array.new
content.gets.split(",").sort.each do |f|
	a = f.gsub(/"/,"")
    words << a
end


def letter_value(s)
	letters = ("A".."Z").to_a
	value = letters.index(s) + 1
end

def triang_number(s)
	triang_number = 0
	(1..100).each do |n|
		if s  == 0.5 * n * ( n + 1 )
			triang_number += 1
		end
	end
	triang_number
end

triang = 0
value = 0

val = Array.new
occ = Array.new
words.each do |name|
	value = 0
	name.each_char do |letter|
        value += letter_value(letter) 
    end
    val << value
    triang += triang_number(value)
    occ << triang
end

puts triang