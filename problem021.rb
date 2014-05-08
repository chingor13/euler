# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

require 'set'
require 'pp'
require 'prime'

def factors(n)
  return Set.new unless n

  factors = Set.new([1])
  Prime.prime_division(n).each do |f, count|
    count.times do |i|
      new_factors = factors.map{|val| val * f}
      factors += new_factors
    end
  end
  factors
end

def divisors(n)
  factors(n).delete(n)
end

$cache = {}
def sum_of_divisors(n)
  $cache.fetch(n) do
    $cache[n] = divisors(n).reduce(&:+)
  end
end

$cache = {}
amicable_pairs = Set.new

1.upto(10_000) do |i|
  sud = sum_of_divisors(i)
  if sud != i && sum_of_divisors(sud) == i
    amicable_pairs.add([i, sud].sort)
  end
end

pp amicable_pairs
pp amicable_pairs.to_a.flatten.uniq.reduce(&:+)