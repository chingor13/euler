# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require 'pp'

max = 1000

the_triple = nil
1.upto(max / 3) do |a|
  # c > b > a
  (a + 1).upto(1000 - a - a) do |b|
    sqrt = Math.sqrt(a ** 2 + b ** 2)
    if sqrt == sqrt.to_i
      triple = [a, b, sqrt.to_i]
      if triple.reduce(&:+) == 1000
        the_triple = triple
      end
    end
  end
end

puts "the triple"
pp the_triple
puts the_triple.reduce(&:*)