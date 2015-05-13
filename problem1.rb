
def sum_of_threes_and_fives(start)
  total = 0
  numbers = 0...start
  numbers.each do |x|
    total += x if multiple_of_three_or_five?(x)
  end
  total
end

def multiple_of_three?(x)
  x % 3 == 0
end

def multiple_of_five(x)
  x % 5 == 0
end

def multiple_of_three_or_five?(x)
  multiple_of_three?(x) || multiple_of_five?(x)
end

sum_of_threes_and_fives(10)
sum_of_threes_and_fives(1000)