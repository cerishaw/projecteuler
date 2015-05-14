class Array
  def square
    self.map {|num| num ** 2}
  end
end

def sum_of_squares(x)
  (1..x).to_a.square.inject(:+)
end

def square_of_sum(x)
  (1..x).inject(:+) ** 2
end

def sum_square_difference(x)
  square_of_sum(x) - sum_of_squares(x)
end

sum_square_difference(10)
sum_square_difference(100)