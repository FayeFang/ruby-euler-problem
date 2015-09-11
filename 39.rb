s = {}
(1..500).each do |a|
	(a..500).each do |b|
		(b..500).each do |c|
			if a**2 + b**2 == c**2 
				s[a+b+c] ||= 0
				s[a+b+c] += 1
			end
		end
	end
end
puts s.max { |a,b| a[1] <=> b[1] }[0]

puts s.max