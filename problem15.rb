class GridPath
  def initialize(num_rows, num_cols)
    @max_row_index = num_rows - 1
    @max_col_index = num_cols - 1
  end

  def paths(row, col)
    if(row == @max_row_index)
      [[0,1]]
    elsif col == @max_col_index
      [[1,0]]
    else
      [[0,1], [1,0]]
    end
  end

  def traversable_paths(row = 0, col = 0)
    count = 0
    available_paths = paths(row,col)
    #puts "row:#{row}, col:#{col} available_paths:#{available_paths.to_s}"
    available_paths.each do |path|
      next_row = row + path[0]
      next_col = col + path[1]
      return count += 1 if(next_row == @max_row_index && next_col == @max_col_index)
      count += traversable_paths(next_row,next_col)
    end
    count
  end
end

gp = GridPath.new(3,3)
gp.traversable_paths