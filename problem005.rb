# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require 'pp'
require 'prime'

max = 20
# max = 10

primes = Hash.new { 0 }
(1..max).each do |i|
  factors = Prime.prime_division(i)
  factors.each do |factor|
    current = primes[factor[0]]
    primes[factor[0]] = factor[1] if factor[1] > current
  end
end

puts Prime.int_from_prime_division(primes.to_a)