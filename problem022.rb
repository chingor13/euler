# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

require 'csv'
require 'pp'

names = CSV.parse(File.read(File.expand_path("../data/names.txt", __FILE__))).first.sort

def word_to_value(word)
  word.downcase.split('').map{|char| char.ord - 96}.reduce(&:+)
end

total = 0
names.each_with_index do |name, i|
  total += word_to_value(name) * (i + 1)
end
puts total