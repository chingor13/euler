# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

# 3
# 7 4
# 2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

# NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)

data = File.read(File.expand_path("../data/triangle.txt", __FILE__)).strip.split("\n").map{|row| row.split(" ").map(&:to_i) }

paths = Array.new(data.length) { Array.new }

data.reverse.each_with_index do |row, i|
  row.each_with_index do |value, j|
    if i == 0
      paths[i][j] = value
    else
      paths[i][j] = value + [paths[i-1][j], paths[i-1][j+1]].max
    end
  end
end

# pp paths.reverse

puts paths[data.length-1][0]