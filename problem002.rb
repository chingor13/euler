# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

LIMIT = 4_000_000
# LIMIT = 100

sum = 2
cache = [1, 2]

begin
  fib = cache[0] + cache[1]
  break if fib >= LIMIT

  sum += fib if (fib % 2 == 0)
  cache.push(fib).shift
end while(true)

puts sum
