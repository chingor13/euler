# In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.


# 131 673 234 103 18
# 201 96  342 965 150
# 630 803 746 422 111
# 537 699 497 121 956
# 805 732 524 37  331

# Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only moving right and down.
require 'pp'
require 'csv'

# data = %{
# 131 673 234 103 18
# 201 96  342 965 150
# 630 803 746 422 111
# 537 699 497 121 956
# 805 732 524 37  331
# }.strip.split("\n").map{|row| row.split(/\s+/) }

data = CSV.parse(File.read(File.expand_path("../data/matrix.txt", __FILE__)))
data = data.map{|row| row.map(&:to_i) }

paths = Array.new(data.length) { Array.new(data.length) }

data.reverse.transpose.reverse.each_with_index do |row, i|
  row.each_with_index do |value, j|
    if i == 0
      if j == 0
        paths[i][j] = value
      else
        paths[i][j] = value + paths[i][j-1]
      end
    else
      if j == 0
        paths[i][j] = value + paths[i-1][j]
      else
        paths[i][j] = [
          value + paths[i][j-1],
          value + paths[i-1][j]
        ].min
      end
    end
  end
end

puts paths.last.last