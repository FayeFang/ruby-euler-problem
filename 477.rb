# sequence = Array.new(100,0)
# # puts sequence.length
# for i in 1..9999
#                 sequence[i] = (sequence[i-1]**2 + 45) % (1000000007)
#                 i =+ 2
# end
# even = sequence.values_at(* sequence.each_index.select {|i| i.even?})
# sum = 0
# puts even.inject{|sum , x| sum + x}
# odd = sequence.values_at(* sequence.each_index.select {|i| i.odd?})
# puts odd.inject{|sum , x| sum + x}

class Polynomial
  attr_accessor :coefficients 

  def initialize(coefficients)
    self.coefficients = coefficients.reverse
  end

  def evaluate(x)
    coefficients.map.with_index { |k, power| k * (x**power) }.reduce(0, :+)
  end
end

polynomial = Polynomial.new([45, 4284990, 26365463243,  2495838522951])
puts polynomial.evaluate() #=> 65