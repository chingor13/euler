# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

max = 1000
sum = 0
1.upto(max) do |i|
  sum =  (sum + (i ** i)) % 10_000_000_000
end

puts sum