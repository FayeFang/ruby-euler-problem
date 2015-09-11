names = File.open(Dir.pwd, "names.txt","r+")

Name = Array.new
names.gets.split(",").sort.each do |f|
	a = f.gsub(/"/,"")
    Name << a
end

def letter_value(s)
	letters = ("A".."Z").to_a
	value = letters.index(s) +1
end

s = 0
Name.each do |name|
	name.each_char do |letter|
    position = Name.index(name) + 1
    value = letter_value(letter) 
    s += position * value
  end
end

puts letter_value("A")


