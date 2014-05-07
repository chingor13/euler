# Multiples of 3 and 5 below 1000 summed

sum = 0
1.upto(999) do |i|
  sum += i if (i % 3 == 0) || (i % 5 == 0)
end
puts sum