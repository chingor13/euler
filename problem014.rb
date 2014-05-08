# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

$cache = {
  1 => 1
}

def chain_length(n)
  $cache.fetch(n) do
    length = if n % 2 == 0
      # even
      1 + chain_length(n/2)
    else
      1 + chain_length(3 * n + 1)
    end
    $cache[n] = length
  end
end

number = nil
chain_size = 0
1.upto(999_999) do |i|
  cl = chain_length(i)
  if cl > chain_size
    chain_size = cl
    number = i
  end
end
puts "#{number} produces chain size of: #{chain_size}"