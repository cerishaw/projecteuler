require "prime.rb"

def smallest_multiple(x)
  numbers = (1..x).to_a.reverse
  unit = smallest_unit(numbers)
  total = unit
  while !divides_by_all_numbers?(numbers, total) do
    total = total + unit
  end
  total
end

def divides_by_all_numbers?(range, value)
  range.each do |x|
    return false unless value % x == 0
  end
  true
end

def smallest_unit(range)
  total = 1
  range.each do |x|
    total = total * x if Prime.prime?(x)
  end
  total
end

smallest_multiple(10)
smallest_multiple(20)