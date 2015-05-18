@rows = [[75],
[95,64],
[17,47,82],
[18,35,87,10],
[20,4,82,47,65],
[19,1,23,75,3,34],
[88,2,77,73,7,63,67],
[99,65,0,28,06,16,70,92],
[41,41,26,56,83,40,80,70,33],
[41,48,72,33,47,32,37,16,94,29],
[53,71,44,65,25,43,91,52,97,51,14],
[70,11,33,28,77,73,17,78,39,68,17,57],
[91,71,52,38,17,14,91,43,58,50,27,29,48],
[63,66,4,68,89,53,67,30,73,16,69,87,40,31],
[04,62,98,27,23,9,70,98,73,93,38,53,60,4,23]]

def adjacent_cells(row, col)
  [[row + 1, col],[row + 1,col+1]]
end

def above_cells(row,col)
  above_row = row - 1
  first_col = col - 1
  second_col = col
  if first_col == -1
    return [[above_row,second_col]]
  elsif second_col == row
    return [[above_row, first_col]]
  else
    return [[above_row, first_col],[above_row,second_col]]
  end
end

def cell_value(row,col)
   @rows[cell[0]][cell[1]]
end

def adjacent_cell_values(triangle,row,col)
  values = []
  higher_cells = above_cells(row, col)
  higher_cells.each do |cell|
    values << triangle[cell[0]][cell[1]]
  end
  values
end

def collapse_triangle(triangle)
  summed_triangle = []
  summed_triangle[0] = triangle[0]
  rows = triangle.count
  (1..(rows-1)).each do |row|
    summed_triangle << []
    (0..row).each do |col|
      current_cell_value = triangle[row][col]
      possible_values = adjacent_cell_values(summed_triangle,row,col)
      summed_triangle[row] << current_cell_value + possible_values.max
    end
  end
  summed_triangle[rows - 1]
end

(collapse_triangle @rows).max