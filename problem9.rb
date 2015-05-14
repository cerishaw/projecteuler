def solve_pythagerous_given_a(sum, a)
  numerator = sum / 2 - a
  demoninator = 1 - (a.to_f/sum)
  numerator / demoninator
end

def whole_number?(x)
  x.round == x
end

def find_triplet(sum)
  a_values = 1..(sum-2)
  a_values.each do |a|
    b = solve_pythagerous_given_a(sum, a)
    return [a,b, (sum-a-b)] if whole_number?(b)
  end
  -1
end

find_triplet(12).inject(:*)
find_triplet(1000).inject(:*)