sudoku = File.open("/Users/CutePotatoDigger/Documents/RUBY/sudoku.txt","r+")

S= Array.new
sudoku.map.with_index { |f, index|
	S << f
}


s = S[11..19]
dup = s.dup

all_number = (0..9).to_a

def sub_array_size(a , b)
	sub_array = Array.new
	if  a.to_f/3 < 1
		sub_array[0] = 0
	elsif a.to_f / 3 < 2
		sub_array[0] = 3
	elsif a.to_f / 3 < 3
		sub_array[0] = 6
	end
	if  b.to_f/3 < 1
		sub_array[1] = 0
	elsif b.to_f / 3 < 2
		sub_array[1] = 3
	elsif b.to_f / 3 < 3
		sub_array[1] = 6
	end
	sub_array
end

def sub_array(sudoku, a, b)
	sub = Array.new
	sub = sudoku[(sub_array_size(a,b)[0])..(sub_array_size(a,b)[0]+2)].map {|r| r[(sub_array_size(a,b)[1])..(sub_array_size(a,b)[1]+2)]}
end

def eliminate(sudoku, a, b)
    all_number = ("0".."9").to_a
	f = Array.new
	f << sudoku[a].strip.chars.uniq
	f << sudoku[0..8].map {|r| r[b]}.uniq
	sub_array(sudoku,a,b).map {|s|

		s = s.chars.uniq
		f << s
		f
	}
	all_number - f.flatten.uniq
end

def solved(sudoku)
	sudoku.any? {|s|
		s.include?(0.to_s)
	}
end

def solve(sudoku)
	# while solved(sudoku)
		(0..8).each do |a|
			(0..8).each do |b|
				if sudoku[a][b] == 0.to_s
				    if eliminate(sudoku, a, b).count == 1
				    	sudoku[a][b] = eliminate(sudoku, a, b).map {|value| value.to_s}.join
				    end
					# sudoku[a][b] = eliminate(sudoku, a, b).map {|value| value.to_s}
				end
	        end
	    end
	# end
    sudoku
end

a = solve(dup)

b = solve(a)

c = solve(b)

(0..8).each do |a|
	(0..8).each do |b|
		if c[a][b] == 0.to_s
		    puts [a, b, eliminate(c, a, b)].inspect
			# sudoku[a][b] = eliminate(sudoku, a, b).map {|value| value.to_s}
		end
  end
end

