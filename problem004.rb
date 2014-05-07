# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

require 'prime'
require 'pp'

min = 100 * 100
max = 999 * 999

Fixnum.class_eval do
  def palindrome?
    to_s.palindrome?
  end
end

String.class_eval do
  def palindrome?
    self == reverse
  end
end

largest = nil
max.downto(min) do |i|
  next unless i.palindrome?

  root = Math.sqrt(i).to_i
  root.downto(100) do |j|
    if i % j == 0 && (i/j).to_s.length == 3
      largest = i
      break
    end
    break if largest
  end
  break if largest
end

puts "largest: #{largest}"