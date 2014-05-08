# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


# How many such routes are there through a 20×20 grid?

# Woohoo dynamic programming

require 'pp'

grid_size = 20

grid = Array.new(grid_size + 1) { Array.new(grid_size + 1) }

grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    if i == 0 || j == 0
      grid[i][j] = 1
    else
      grid[i][j] = grid[i-1][j] + grid[i][j-1]
    end
  end
end

puts grid[grid_size][grid_size]