
def isPerfectSquare(s)
  if s > 0
	  sqrt = Math.sqrt(s)
	  s == sqrt.round**2 and s> 0 ? true : false
  else
  	return false
  end
end

def quadratic_solver(a,b)
	sol = []
	sol[0] = ((a - Math.sqrt(a**2+4*b)) /2)
	sol[1] = ((a + Math.sqrt(a**2+4*b)) /2)
	if sol[0]**2 <= sol[1]**2
		sol[2] = sol[0]**2
		sol[3] = sol[1]**2
  else
  	sol[2] = sol[1]**2
		sol[3] = sol[0]**2
  end
	sol.map(&:to_i)
end

def in_the_area(a,b)
	z = 0
	(quadratic_solver(a,b)[0]..quadratic_solver(a,b)[1]).each do |x|
		(0..quadratic_solver(a,b)[3]).each do |y|
	    if (a*x + b >= y and x**2 <= y)
	    	z += 1
	    end
	  end
	end
	return z
end

s = 0

(-1000000000000..1000000000000).each do |a|
	(-1000000000000..1000000000000).each do |b|
		if a**2+4*b > 0
			if isPerfectSquare(a**2+4*b)
			  s += in_the_area(a,b)	% 100000000
			end	
		elsif a**2+4*b == 0
			s += 1 % 100000000
		end
	end
end 

puts s

