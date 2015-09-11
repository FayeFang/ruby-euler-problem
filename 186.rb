module LagFibonacci
	@fib = Array.new
	b = 1
	@fib << 0
	while b <= 55
		@fib << (100003 - 200003 * b + 300007 * b**3) % 1000000
		b += 1
	end

	def self.fib_array(k)
		@fib[k] ||= (fib_array(k-24) + fib_array(k-55)) % 1000000
	end
end


puts LagFibonacci.fib_array(10000000)

